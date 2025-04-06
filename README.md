# Decentralized Specialized Film Prop Authentication

A blockchain-based solution for verifying authenticity and provenance of film props from production to collectors.

## Overview

This system uses blockchain technology to provide immutable verification of film props, establishing a trusted chain of custody from production through screen use to collector ownership. The architecture consists of four interconnected smart contracts that authenticate props throughout their lifecycle, ensuring transparency and preventing counterfeit items in the collector market.

## Core Components

### 1. Production Verification Contract

Validates legitimate film projects through:
- Production company verification
- Film project registration
- Budget and timeline documentation
- Cast and crew authentication
- Studio/location certification

### 2. Prop Registration Contract

Records and verifies:
- Prop creator/fabricator information
- Physical specifications and materials
- Creation date and production context
- Digital fingerprinting (high-resolution images)
- Unique identifier assignment
- Designer attestation

### 3. Screen Appearance Contract

Documents on-screen usage:
- Scene timestamps and descriptions
- Character interaction details
- Screen time duration
- Production notes on prop significance
- Visual documentation of on-screen appearance
- Actor interaction verification

### 4. Provenance Contract

Tracks chain of custody through:
- Post-production storage
- Auction or sale history
- Owner transfer records
- Authentication certifications
- Exhibition history
- Restoration/preservation documentation

## Getting Started

### Prerequisites

- Ethereum-compatible blockchain network
- Node.js v16.0+
- Truffle Suite v5.0+
- MetaMask or similar Web3 wallet
- IPFS for decentralized media storage

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/film-prop-authentication.git
   cd film-prop-authentication
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Compile smart contracts:
   ```
   truffle compile
   ```

4. Deploy to your preferred network:
   ```
   truffle migrate --network [network-name]
   ```

## Usage

### For Production Companies

1. Register on the Production Verification Contract
2. Create digital certificates for each film project
3. Register props used in production
4. Document screen appearances with timestamp proofs
5. Initialize provenance tracking upon production wrap

### For Prop Masters & Designers

1. Register created props with detailed specifications
2. Provide attestation of creation and authenticity
3. Document modifications during production
4. Link props to specific scenes and characters

### For Auction Houses & Collectors

1. Verify complete prop history before purchase
2. Access authenticated screen appearance data
3. Confirm unbroken chain of custody
4. Register ownership transfers securely
5. Generate certificates of authenticity

### For Fans & Museums

1. Verify exhibited props with confidence
2. Access the complete journey of significant props
3. View screen appearance documentation
4. Connect physical props to their on-screen moments

## API Reference

The system provides REST APIs for integration with production tracking systems and auction platforms:

- `POST /api/production/verify` - Register a film production
- `GET /api/production/:id` - Get production verification status
- `POST /api/prop/register` - Create new prop registration
- `GET /api/prop/:id` - Get prop registration details
- `POST /api/appearance/document` - Submit screen appearance record
- `GET /api/appearance/:propId` - Get all screen appearances for a prop
- `POST /api/provenance/transfer` - Record ownership transfer
- `GET /api/provenance/:propId` - Get complete ownership history

## Architecture

The system implements a hybrid architecture:
- On-chain: Core verification data, ownership transfers, and attestations
- Off-chain: High-resolution images, video clips, and detailed documentation (IPFS hashes stored on-chain)

Smart contracts use role-based access control to ensure only authorized entities can modify records.

## Security Considerations

- Multi-signature requirements for ownership transfers
- Time-locked escrow mechanisms for high-value transactions
- Integration with physical authentication methods (NFC/RFID)
- Regular security audits recommended
- Privacy protections for high-profile collectors

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.
