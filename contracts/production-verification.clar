;; Production Verification Contract
;; Validates legitimate film projects

;; Data variables
(define-data-var last-production-id uint u0)
(define-data-var contract-owner principal tx-sender)

;; Data maps
(define-map productions
  { production-id: uint }
  {
    title: (string-ascii 100),
    director: (string-ascii 100),
    production-company: (string-ascii 100),
    year: uint,
    verified: bool
  }
)

(define-map production-admins
  { production-id: uint }
  { admin: principal }
)

;; Register a new production
(define-public (register-production (title (string-ascii 100)) (director (string-ascii 100)) (production-company (string-ascii 100)) (year uint))
  (let
    (
      (new-id (+ (var-get last-production-id) u1))
    )
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u403))
    (map-set productions
      { production-id: new-id }
      {
        title: title,
        director: director,
        production-company: production-company,
        year: year,
        verified: false
      }
    )
    (map-set production-admins
      { production-id: new-id }
      { admin: tx-sender }
    )
    (var-set last-production-id new-id)
    (ok new-id)
  )
)

;; Verify a production
(define-public (verify-production (production-id uint))
  (let
    (
      (production (unwrap! (map-get? productions { production-id: production-id }) (err u404)))
      (admin-data (unwrap! (map-get? production-admins { production-id: production-id }) (err u404)))
    )
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u403))
    (map-set productions
      { production-id: production-id }
      (merge production { verified: true })
    )
    (ok true)
  )
)

;; Get production details
(define-read-only (get-production (production-id uint))
  (map-get? productions { production-id: production-id })
)

;; Check if production is verified
(define-read-only (is-production-verified (production-id uint))
  (default-to false (get verified (map-get? productions { production-id: production-id })))
)

;; Transfer ownership
(define-public (transfer-ownership (new-owner principal))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u403))
    (var-set contract-owner new-owner)
    (ok true)
  )
)

