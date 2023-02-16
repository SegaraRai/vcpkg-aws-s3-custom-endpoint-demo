#!/bin/bash

set -e

# Good
./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/
./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/,readwrite
./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/,readwrite,endpoint-url=https://s3.us-east-1.amazonaws.com,profile=default
./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/,readwrite,profile=default,endpoint-url=https://s3.us-east-1.amazonaws.com
./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/,readwrite,profile=default,profile=override

# Bad
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/,readwrite,profile=default,profile=override,profile=TOO_MANY_ARGS
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/,readwrite,UNKNOWN=PARAMS
! ./.vcpkg/vcpkg install --debug --binarysource=x-aws,s3://vcpkg-binary-caching-example/,profile=default # missing <rw>
