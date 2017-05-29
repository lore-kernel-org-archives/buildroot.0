From: Graham Holland <gmh7@sfu.ca>
Date: Mon, 29 May 2017 16:20:46 -0700
Subject: [Buildroot] package hwloc does not install to staging
Message-ID: <66428c29-990f-e0d4-9164-92e5dae4e736@sfu.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm curious if there is a reason for the hwloc package not including
the following:

HWLOC_INSTALL_STAGING = YES

so that the hwloc.h header is copied to the staging directory

I am porting a package that has a dependency on hwloc and which uses
pkg-config in its build system to detect hwloc compiler flags. If I
modify the hwloc.mk file to include the above, then this works
correctly.

Thanks,

Graham
