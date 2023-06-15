import contract from "@truffle/contract"

export const loadContract = async (name, provider) => {
    const res = await fetch(`/contracts/${name}.json`)
    const artifacts = await res.json()
    const _contract = contract(artifacts)
    _contract.setProvider(provider)
    let dployedContract = null
    try {
        dployedContract = await _contract.deployed()
    } catch {
        console.error("you are connected to wrong network");
    }
    return dployedContract
}