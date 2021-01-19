#!/usr/bin/env python
from __future__ import division
__metaclass__ = type
import commands,json,sys

node_name = sys.argv[1]

while node_name not in json.loads(commands.getoutput('ceph quorum_status'))['quorum_names'] :
    continue
