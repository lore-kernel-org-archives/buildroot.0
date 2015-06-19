From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Jun 2015 20:19:43 +0200
Subject: [Buildroot] [git commit] lftp: bump to version 4.6.3a
Message-ID: <20150619190635.5DB1880E3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62afb7c4d158d48a0724c032afdc8fa0a348a963
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 4.6.3a
- Update hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lftp/lftp.hash |    2 +-
 package/lftp/lftp.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index a832087..f1e45bc 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1e61d5c94b06c333309185e86cfce0729e45e3f69f7496c58d61093b135c8bb9  lftp-4.6.2.tar.xz
+sha256  8c3a12a1f9ec288132b245bdd7d14d88ade1aa5cb1c14bb68c8fab3b68793840  lftp-4.6.3a.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 362ad28..b69e2d6 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.6.2
+LFTP_VERSION = 4.6.3a
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
