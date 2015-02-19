From: Dale Ghent <daleg@omniti.com>
Date: Thu, 19 Feb 2015 16:22:16 +0000
Subject: [Buildroot] [PATCH] ktap: bump version to gain kernel 3.18.x
	compatibility
Message-ID: <1424362937-14281-1-git-send-email-daleg@omniti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the hashref to the current ktap HEAD to bring in fixes for compiling it
against 3.18.x kernels, and obviate the need for a local patch to add stdarg.h
to its includes.

Dale Ghent (1):
  ktap: bump version

 .../ktap/0001-Add-missing-stdarg.h-include.patch   | 47 ----------------------
 package/ktap/ktap.mk                               |  2 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 package/ktap/0001-Add-missing-stdarg.h-include.patch

-- 
1.9.1
