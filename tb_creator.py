#!/usr/bin/env python
import re


class tesbench_creator:

    def __init__(self, path):
        self.path = path

    def abrir_archivo(self):
        f = open(self.path, 'r')
        content = f.read()

        pattern_module = re.search('module\s(.*)', content)
        string_module = pattern_module.group(1)

        pattern_module_2 = re.search("(.*)\s*\((.*?)\)", string_module)
        module_name = pattern_module_2.group(1)
        ports = pattern_module_2.group(2)



if __name__ == "__main__":
    creator = tesbench_creator("design.sv")
    creator.abrir_archivo()
