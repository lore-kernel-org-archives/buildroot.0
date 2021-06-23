From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 09:04:14 +0200
Subject: [Buildroot] [git commit] package/dovecot-pigeonhole: security bump
 version to 0.5.15
Message-ID: <20210623063326.0879D88323@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a55fedb48f83173611db3f6dc2e140cd33c1dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2020-28200:
https://dovecot.org/pipermail/dovecot-news/2021-June/000460.html

Release notes:
https://dovecot.org/pipermail/dovecot-news/2021-June/000458.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index cf3ebdbf54..58444ab7e8 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  68ca0f78a3caa6b090a469f45c395c44cf16da8fcb3345755b1ca436c9ffb2d2  dovecot-2.3-pigeonhole-0.5.14.tar.gz
+sha256  e1498f50cef74c351a57474cc423b008627ab1ab60724b859283ead6d00550d0  dovecot-2.3-pigeonhole-0.5.15.tar.gz
 sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 35a1e1ef52..c0bef6bedc 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.14
+DOVECOT_PIGEONHOLE_VERSION = 0.5.15
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
