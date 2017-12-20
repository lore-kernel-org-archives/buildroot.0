From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:54:23 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/exim: security
 bump to version 4.89.1
Message-ID: <20171220210024.BFA5B835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28b6850585e7538e8c83459170c21290e9858a30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-16943 & CVE-2017-16944:
https://lists.exim.org/lurker/message/20171128.215505.79ea8efa.en.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 06473084f4945eb254e589f7935228ae613ec540)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.hash | 2 +-
 package/exim/exim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 29b9989..d961083 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 912f2ee03c8dba06a3a4c0ee40522d367e1b65dc59e38dfcc1f5d9eecff51ab0  exim-4.89.tar.bz2
+sha256 1c853bc960dff0a0e51e3e28bc4a4a8165b58b41bb64ea3abb90f254d9947a8c  exim-4.89.1.tar.bz2
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 8638388..1eeb182 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.89
+EXIM_VERSION = 4.89.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
