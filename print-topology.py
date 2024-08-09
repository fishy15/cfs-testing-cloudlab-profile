import gdb

CORES = 16

# connect to remote
gdb.execute('file kbuild/vmlinux')
gdb.execute('tar rem :1234')

fns = [
    'cpu_smt_mask',
    'cpu_clustergroup_mask',
    'cpu_coregroup_mask',
    'cpu_cpu_mask',
]

gdb.execute('b set_sched_topology')
gdb.execute('c')

for f in fns:
    for i in range(16):
        command = f'p/t *({f}({i}))'
        print('command:', command)
        print(gdb.execute(command))
