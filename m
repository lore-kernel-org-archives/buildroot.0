From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 20:39:16 +0100
Subject: [Buildroot] [git commit] erlang: bump to version R16B03
Message-ID: <20131215195558.768119C036@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=472f629fa9253f13d037b46d30136080239a1a8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 34d027b..18ceb7b 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = R16B01
+ERLANG_VERSION = R16B03
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
