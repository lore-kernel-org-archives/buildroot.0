From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Jun 2013 00:38:13 +0200
Subject: [Buildroot] [PATCH 2/2] legacy: make it clear legacy options will
	be removed at some point
In-Reply-To: <cover.1372545265.git.yann.morin.1998@free.fr>
References: <cover.1372545265.git.yann.morin.1998@free.fr>
Message-ID: <0e43364c4b19cbab8f8297f38ab009475beba3d6.1372545265.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1252d16..921a0eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -38,6 +38,10 @@ comment "Please look at the options which have been selected "
 comment "and read their help text.                           "
 comment "As long as these options stay selected, the build   "
 comment "will fail.                                          "
+comment "Note: at some point in the future, the oldest legacy"
+comment "options will be removed, and configuration files    "
+comment "that still have those options set, will fail to     "
+comment "build, or run, in unpredictable ways.               "
 endif
 
 ###############################################################################
-- 
1.8.1.2
