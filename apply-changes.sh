#!/bin/bash

set -eo pipefail

do_cleanup() {
	echo "Putting / back into read-only mode"
	ssh -q remarkable mount -o remount,ro /
}
trap do_cleanup EXIT


echo "Putting / into read-write mode"
ssh -q remarkable mount -o remount,rw /

# ---
#  Copy all custom .png files
# ---

echo "Copying custom splash screens..."
for PNG in custom/*.png; do
 	scp "$PNG" remarkable:"/usr/share/remarkable/$(basename "$PNG")"
done

# ---
#  Copy custom templates
# ---

echo "Copying custom templates..."
for TEMPLATE in custom/templates/GERMIS-* custom/templates/*.json; do
	scp "$TEMPLATE" remarkable:"/usr/share/remarkable/templates/$(basename "$TEMPLATE")"
done


echo "Done"