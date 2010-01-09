From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat, 09 Jan 2010 13:03:25 -0500
Subject: [Buildroot] [PATCH 0/2] kernel modules category
Message-ID: <1263060205.18571.11.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following series of patches adds a kernel modules category for packages
        and adds the cdfs package as the first package to the category.

Clark Rawlins (2):
  Support for a kernel-modules catagory
  A package for the cdfs kernel module

 package/Config.in                        |    3 ++
 package/kernel-modules/Config.in         |    3 ++
 package/kernel-modules/cdfs/Config.in    |    7 ++++++
 package/kernel-modules/cdfs/cdfs.mk      |   31 ++++++++++++++++++++++++++++++
 package/kernel-modules/kernel-modules.mk |    1 +
 5 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 package/kernel-modules/Config.in
 create mode 100644 package/kernel-modules/cdfs/Config.in
 create mode 100644 package/kernel-modules/cdfs/cdfs.mk
 create mode 100644 package/kernel-modules/kernel-modules.mk
