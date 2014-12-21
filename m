From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 13:22:39 +0100
Subject: [Buildroot] [git commit] sudo: adjust libtool comment
Message-ID: <20141221122244.41E2A80427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66cfe52fe4f21a5b1c99940d45fa52acb54a76c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sudo/sudo.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 61635ec..df3910e 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -8,7 +8,8 @@ SUDO_VERSION = 1.8.10p3
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-# Ships a non-release libtool that isn't patch-friendly
+# Ships a beta libtool version hence our patch doesn't apply.
+# Run autoreconf to regenerate ltmain.sh.
 SUDO_AUTORECONF = YES
 SUDO_CONF_OPTS = \
 		--without-lecture \
