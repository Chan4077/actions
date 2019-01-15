#!/bin/bash

GH_PAGES_TYPE=${GH_PAGES_TYPE:-"project"}

if [[ "$GH_PAGES_TYPE" = "project" ]]; then
  echo "Building project site..."
  # TODO: Implement functionality
elif [[ "$GH_PAGES_TYPE" = "user" ]]; then
  echo "Building user site..."
  # TODO: Implement functionality
fi
