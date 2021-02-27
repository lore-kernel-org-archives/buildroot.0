From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:13:19 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/bind: bump
 version to 9.11.25
Message-ID: <20210227182008.003268396F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe8d9bf0f98ae2de13a0aa2116bd980bfa414053
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Release notes:
https://ftp.isc.org/isc/bind9/9.11.25/RELEASE-NOTES-bind-9.11.25.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 39b582eba40ed2919aca66b10b66dcee77ee02ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index cbd9562b56..ae196dacd5 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.24/bind-9.11.24.tar.gz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.11.25/bind-9.11.25.tar.gz.asc
 # with key 95CEDA256B1CA0A15F302FB59521A7ED5DACE918
-sha256  f261587c5d37c7f14e8393547c4556faefa701a646930f1b6408d71519a30428  bind-9.11.24.tar.gz
+sha256  8491c24e5a3da68f421d0fcb946602c8d0ff963012fdd176b8026c8890f3a117  bind-9.11.25.tar.gz
 sha256  e316d9d12b3cc3600985d71011d7856f5ff93d28e748155a3a18171b32d98d8b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index ba60c111ef..4098f948a9 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.24
+BIND_VERSION = 9.11.25
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
