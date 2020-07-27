From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 08:51:23 +0200
Subject: [Buildroot] [git commit] package/librtas: bump to version 2.0.2
Message-ID: <20200727064710.3FE6B88E5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24f96c818eb192066679e9359a593fe0680524c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/librtas/librtas.hash | 4 ++--
 package/librtas/librtas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
index 086d0d7cbc..de0c0a476c 100644
--- a/package/librtas/librtas.hash
+++ b/package/librtas/librtas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a79fd9cdb2f03e7401027fb80a07f14e29b86cc2d363126d527b211fea85d025 librtas-2.0.1.tar.gz
-sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c COPYING.LESSER
+sha256  b47b2a6f140347ac265e2c66ddf68293f6cdcc7c0c9a78c6e21ff52846465415  librtas-2.0.2.tar.gz
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LESSER
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index 48c8d0143f..c92a9e2fa4 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRTAS_VERSION = 2.0.1
+LIBRTAS_VERSION = 2.0.2
 LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,v$(LIBRTAS_VERSION))
 LIBRTAS_LICENSE = LGPL-2.1+
 LIBRTAS_LICENSE_FILES = COPYING.LESSER
