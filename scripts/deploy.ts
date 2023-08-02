import { ethers } from 'hardhat'

async function main() {
	console.log('start')

	const [deployer] = await ethers.getSigners()
	console.log('Deploying contracts with the account:', deployer.address)

	const porFactory = await ethers.getContractFactory('NSExtentionStore')
	const feeData = await ethers.provider.getFeeData()
	console.log('Fee data is ', feeData)

	const por = await porFactory.deploy()
	await por.deployed()
	console.log('address: ', por.address)
	console.log('finish')
}

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error)
		process.exit(1)
	})
