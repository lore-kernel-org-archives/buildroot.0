From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 20:08:30 +0100
Subject: [Buildroot] [git commit] package/dash: drop the default value of
	the DASH_SOURCE variable
Message-ID: <20171031190547.751BD7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e41f4d239b1efc6e4b595196152ae05fc18d3662
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 72ef722..c8b4164 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 DASH_VERSION = 0.5.9.1
-DASH_SOURCE = dash-$(DASH_VERSION).tar.gz
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
