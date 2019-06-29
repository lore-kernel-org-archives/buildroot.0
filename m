From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 16:46:29 +0200
Subject: [Buildroot] [PATCH 4/5] package/pcre2: bump version to 10.33
In-Reply-To: <20190629144630.8036-1-bernd.kuhls@t-online.de>
References: <20190629144630.8036-1-bernd.kuhls@t-online.de>
Message-ID: <20190629144630.8036-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.exim.org/lurker/message/20190304.181617.bc5235a2.en.html
http://www.pcre.org/news.txt
https://lists.exim.org/lurker/message/20190416.154043.a260ee6c.en.html

Updated license hash after upstream commit
https://vcs.pcre.org/pcre2/code/tags/pcre2-10.33/LICENCE?r1=1087&r2=1001

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index a3210b184a..03f7eb32db 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.32.tar.bz2.sig
-sha256 f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e  pcre2-10.32.tar.bz2
+# Locally calculated after checking pgp signature at https://ftp.pcre.org/pub/pcre/pcre2-10.33.tar.bz2.sig
+sha256 35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa  pcre2-10.33.tar.bz2
 # Locally computed
-sha256 c4a8b89cd38d6a7501d5b11a472fa15e71a051b66d6331c6cda364101389d6ee  LICENCE
+sha256 982293becea3f18eb4e3ce2145f66638e46d105a27b88418766caf321a684d03  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 6d103c2b9b..61f41e06ea 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.32
+PCRE2_VERSION = 10.33
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.20.1
