

with open("inventory/group_vars/new_server.yaml", "r") as file:
    with open("inventory-example/group_vars/new_server.yaml", "w") as file2:
        file2.writelines((string.split(":")[0] + ": < >\n") if ":" in string else "\n" for string in file)