From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 21:39:33 +0100
Subject: [Buildroot] [git commit] lvm2: bump to version 2.02.111
Message-ID: <20141029203942.AA0F4B1EC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27add471601cb1de0bfccb6ac29088dcf9145939
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.hash |    2 ++
 package/lvm2/lvm2.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
new file mode 100644
index 0000000..10f2905
--- /dev/null
+++ b/package/lvm2/lvm2.hash
@@ -0,0 +1,2 @@
+# From ftp://sources.redhat.com/pub/lvm2/md5.sum
+md5	02487ab2a9e02d1ee76fe217183df28a	LVM2.2.02.111.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 4b06bd4..76c2f82 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.106
+LVM2_VERSION = 2.02.111
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
