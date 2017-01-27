From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jan 2017 15:52:53 -0300
Subject: [Buildroot] [PATCH] hiawatha: bump to version 10.5
Message-ID: <20170127185253.21784-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 31025d9..636dfd5 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e40ebcbde8fbd5a14dbf7279143757aea02a461940daa5c460496871eaa75454	hiawatha-10.4.tar.gz
+sha256	d76155430dc9100de412088bd68978a2a9052832609c7ac961dccaf2550c618a	hiawatha-10.5.tar.gz
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 8821b0f..abe57b7 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.4
+HIAWATHA_VERSION = 10.5
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPLv2
-- 
2.10.2
