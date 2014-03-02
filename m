From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 14:53:53 +0100
Subject: [Buildroot] [git commit] jquery: bump to version 1.11.0
Message-ID: <20140302135433.3D3C39BAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=244bcece4cafa535500748f7e4ffb822e705a7be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jquery/jquery.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index d8e87d7..8188012 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_VERSION = 1.10.2
+JQUERY_VERSION = 1.11.0
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
