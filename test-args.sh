#!/bin/bash

set -e

# Good
./.vcpkg/vcpkg install --binarysource=x-aws-config,no-sign-request
./.vcpkg/vcpkg install --binarysource="x-aws-config,no-sign-request;x-aws-config,https://example.com"

# Bad
! ./.vcpkg/vcpkg install --binarysource=x-aws-config
! ./.vcpkg/vcpkg install --binarysource=x-aws-config,UNKNOWN_PARAM
! ./.vcpkg/vcpkg install --binarysource=x-aws-config,no-sign-request,EXTRA_ARGS
! ./.vcpkg/vcpkg install --binarysource=x-aws-config,endpoint-url
! ./.vcpkg/vcpkg install --binarysource=x-aws-config,endpoint-url,INVALID_URL
! ./.vcpkg/vcpkg install --binarysource=x-aws-config,endpoint-url,https://example.com,EXTRA_ARGS
