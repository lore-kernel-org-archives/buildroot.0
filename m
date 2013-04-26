From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 23:08:51 +0200
Subject: [Buildroot] [git commit] jansson: add empty line after header
Message-ID: <20130426210845.1DBA29B86A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bda4e6ed8875b46e64b401d13d77966a5159f5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missed from previous commit.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jansson/jansson.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index c7183df..9564fc0 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -3,6 +3,7 @@
 # jansson
 #
 #############################################################
+
 JANSSON_VERSION = 2.4
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
