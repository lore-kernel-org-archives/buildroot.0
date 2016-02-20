From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 16:56:38 +0100
Subject: [Buildroot] [git commit branch/next] erlang-lager: bump to version
	2.2.0
Message-ID: <20160220182139.C0B9580333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b712f877ac482be4ea02582b09c23add1019c9af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-lager/erlang-lager.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index b725bfd..19940a9 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 2.0.3
+ERLANG_LAGER_VERSION = 2.2.0
 ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
