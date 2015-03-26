From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Mar 2015 12:06:15 -0300
Subject: [Buildroot] [PATCH] haserl: bump to version 0.9.35
Message-ID: <1427382375-20026-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/haserl/haserl.hash | 4 ++--
 package/haserl/haserl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haserl/haserl.hash b/package/haserl/haserl.hash
index 7b1bfa2..2b23a6c 100644
--- a/package/haserl/haserl.hash
+++ b/package/haserl/haserl.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/haserl/files/haserl-devel/
-md5	a9decddb508944d56f71dd2f821e2ec5	haserl-0.9.33.tar.gz
-sha1	bbb5d55db911fdb854828794181e57a1a275e65d	haserl-0.9.33.tar.gz
+md5	918f0b4f6cec0b438c8b5c78f2989010	haserl-0.9.35.tar.gz
+sha1	9a331d41e9d47a81e81e158f9a16bf5443347cd4	haserl-0.9.35.tar.gz
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 4985c09..05a1a2a 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HASERL_VERSION = 0.9.33
+HASERL_VERSION = 0.9.35
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
 HASERL_LICENSE = GPLv2
 HASERL_LICENSE_FILES = COPYING
-- 
2.0.5
