From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 21:50:19 +0200
Subject: [Buildroot] [git commit] file: security bump to version 5.32
Message-ID: <20170906195113.9A6DB81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89a38e6397fb316792da19fbde4bfa4f9c43fb52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-1000249 - Stack buffer overflow with a specially crafted
.notes section in an ELF binary file.

For more details, see: http://www.openwall.com/lists/oss-security/2017/09/05/3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/file/file.hash | 2 +-
 package/file/file.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index dcf96ec..fee516c 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 09c588dac9cff4baa054f51a36141793bcf64926edc909594111ceae60fce4ee  file-5.31.tar.gz
+sha256 8639dc4d1b21e232285cd483604afc4a6ee810710e00e579dbe9591681722b50  file-5.32.tar.gz
diff --git a/package/file/file.mk b/package/file/file.mk
index 375c60c..df0e0f0 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.31
+FILE_VERSION = 5.32
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
