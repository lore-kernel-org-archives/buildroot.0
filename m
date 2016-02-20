From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 18:38:00 +0100
Subject: [Buildroot] [git commit branch/next] erlang-rebar: bump to version
	2.6.1
Message-ID: <20160220182139.D7C7A80333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=530082e74047aec29d02d70bd4f65890d4d6b0b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-rebar/erlang-rebar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
index f29eb75..06a7800 100644
--- a/package/erlang-rebar/erlang-rebar.mk
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_REBAR_VERSION = 2.5.1
+ERLANG_REBAR_VERSION = 2.6.1
 
 # Upstream publishes a release, but we can not use it as it is a release of
 # a generated rebar script, when we want the sources. So we have to use the
