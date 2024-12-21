# Import the Portal object.
import geni.portal as portal
# Import the ProtoGENI library.
import geni.rspec.pg as pg

# Create a portal context.
pc = portal.Context()

# Create a Request object to start building the RSpec.
request = pc.makeRequestRSpec()

# Add a raw PC to the request.
node = request.RawPC("node")

# Install and execute a script that is contained in the repository.
node.addService(pg.Execute(shell="bash", command="/local/repository/setup.sh &> /local/repository/log"))
bs = node.Blockstore("bs", "/mydata")
bs.size = "200GB"

# Print the RSpec to the enclosing page.
pc.printRequestRSpec(request)
