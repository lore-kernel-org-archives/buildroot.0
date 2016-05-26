From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 May 2016 16:31:23 -0300
Subject: [Buildroot] [PATCH] dos2unix: bump to version 7.3.4
Message-ID: <1464291083-16556-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dos2unix/dos2unix.hash | 2 +-
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 7e1a120..1169592 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f4d5df24d181c2efecf7631aab6e894489012396092cf206829f1f9a98556b94	dos2unix-7.3.1.tar.gz
+sha256	8ccda7bbc5a2f903dafd95900abb5bf5e77a769b572ef25150fde4056c5f30c5	dos2unix-7.3.4.tar.gz
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 21e03ae..82fa26f 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.3.1
+DOS2UNIX_VERSION = 7.3.4
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.7.3
