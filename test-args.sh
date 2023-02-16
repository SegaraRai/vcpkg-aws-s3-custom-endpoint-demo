#!/bin/bash

set -e

# Good
./.vcpkg/vcpkg install --debug --binarysource=x-aws-config,no-sign-request

# Bad
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws-config,endpoint-url,https://example.com

! ./.vcpkg/vcpkg install --debug --binarysource=x-aws-config
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws-config,UNKNOWN_PARAM
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws-config,no-sign-request,EXTRA_ARGS
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws-config,endpoint-url
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws-config,endpoint-url,INVALID_URL
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws-config,endpoint-url,https://example.com,EXTRA_ARGS
