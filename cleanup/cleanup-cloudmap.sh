##!/bin/bash

#
# Delete CloudMap service namespace
#
aws servicediscovery delete-namespace --id $SERVICE_DISCOVERY_NAMESPACE
