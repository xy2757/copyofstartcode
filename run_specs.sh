#!/bin/bash
# Interactive RSpec runner for ESaaS CHIPs.
#
# Presents a menu of the assignment's spec files so students can run a single
# part of the assignment (or the whole suite) without memorizing rspec
# invocations. Shared across chips: the menu is built from whatever files
# match spec/*_spec.rb in the current directory.
#
# Adapted from the NYU CSE Software Engineering version of hw-ruby-intro:
# https://github.com/NYU-CSE-Software-Engineering/hw-ruby-intro

specs=(spec/*_spec.rb)

if [ ! -e "${specs[0]}" ]; then
    echo "No spec files found under spec/ -- are you in the assignment's root directory?"
    exit 1
fi

echo "================================"
echo "RSpec Test Runner"
echo "================================"
echo "Please select which spec to run:"
echo ""

i=1
for spec in "${specs[@]}"; do
    echo "$i) $spec"
    i=$((i + 1))
done
run_all=$i
quit=$((i + 1))
echo "$run_all) Run all spec files"
echo "$quit) Exit"
echo ""
echo -n "Enter your choice [1-$quit]: "

read -r choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "$quit" ]; then
    echo "Invalid choice. Please run the script again and select a number between 1 and $quit."
    exit 1
fi

if [ "$choice" -eq "$quit" ]; then
    echo "Exiting..."
    exit 0
elif [ "$choice" -eq "$run_all" ]; then
    echo ""
    echo "Running all spec files..."
    echo "================================"
    bundle exec rspec
else
    spec="${specs[$((choice - 1))]}"
    echo ""
    echo "Running $spec..."
    echo "================================"
    bundle exec rspec "$spec"
fi

exit $?
