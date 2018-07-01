From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 11:01:51 +0200
Subject: [Buildroot] [git commit] package/nano: bump version to 2.9.8
Message-ID: <20180701085936.79FCB835C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efe67ac14a7fffbc64633bd70f2e72fd0cc92500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upgrade nano to 2.9.8, the latest version as of 2 June 2018:
https://www.nano-editor.org/dist/v2.9/ChangeLog

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index c09f0313d3..2f372933b7 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 d2d30c39caef53aba1ec1b4baff4186d4496f35d2411b0848242a5f2e27e129e  nano-2.9.0.tar.xz
+sha256 c2deac31ba4d3fd27a42fafcc47ccf499296cc69a422bbecab63f2933ea85488  nano-2.9.8.tar.xz
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 458174a473..3815cdcc1c 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.9
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).8
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
