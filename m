From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 23:31:13 +0200
Subject: [Buildroot] [git commit] mongrel2: bump to version v1.9.1
Message-ID: <20140422213117.83F979C99D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bddad55dbe7e29ef168b7b4ec2b4e7e8804419b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mongrel2/mongrel2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 590a522..1614bcc 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGREL2_VERSION = v1.9.0
+MONGREL2_VERSION = v1.9.1
 MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)/
 MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
