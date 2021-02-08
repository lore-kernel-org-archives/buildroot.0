From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 08:32:09 +0100
Subject: [Buildroot] [git commit] package/msmtp: bump version to 1.8.14
Message-ID: <20210208071901.43A7681332@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d291df03c14bdf03de1c04784a1baa2c7d4c3675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/marlam/msmtp-mirror/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 8fc674bfa5..1e73d92470 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.11.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.14.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  f25f0fa177ce9e0ad65c127e790a37f35fb64fee9e33d90345844c5c86780e60  msmtp-1.8.11.tar.xz
+sha256  d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4  msmtp-1.8.14.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 43a9ed1e93..cae03d7724 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.11
+MSMTP_VERSION = 1.8.14
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
