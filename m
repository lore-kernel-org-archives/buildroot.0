From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jan 2011 23:38:48 +0100
Subject: [Buildroot] [git commit master 1/1] xcb-proto: needs python for the
	host
Message-ID: <20110127224051.92BB98D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f13d97e106d115e00b1ca4e9009baaf0de43cd85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xcb-proto/xcb-proto.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 153cc0d..47a38cb 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -9,6 +9,8 @@ XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
 
 XCB_PROTO_INSTALL_STAGING = YES
 
+XCB_PROTO_DEPENDENCIES = host-python
+
 $(eval $(call AUTOTARGETS,package/x11r7,xcb-proto))
 $(eval $(call AUTOTARGETS,package/x11r7,xcb-proto,host))
 
-- 
1.7.3.4
