From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 14:29:36 +0200
Subject: [Buildroot] [git commit] p910nd: bump to version 0.97
Message-ID: <20140611123750.771419CE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50b8dc553f3fa41061a44cde6c2c2b2ac4443f9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/p910nd/p910nd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
index 48bb7e1..73667d7 100644
--- a/package/p910nd/p910nd.mk
+++ b/package/p910nd/p910nd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P910ND_VERSION = 0.95
+P910ND_VERSION = 0.97
 P910ND_SITE = http://downloads.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
 P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
 P910ND_LICENSE = GPLv2
