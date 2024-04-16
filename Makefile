test-deploy:
	forge script script/Deploy.s.sol:DeployScript

deploy:
	forge script script/Deploy.s.sol:DeployScript --broadcast