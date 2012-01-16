From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:36 +0100
Subject: [Buildroot] [PATCH resend 02/22] atk: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/atk/atk.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index f0e96a5..d84d08c 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -52,8 +52,6 @@ endif
 
 ATK_DEPENDENCIES = libglib2 host-pkg-config
 
-HOST_ATK_DEPENDENCIES = host-libglib2 host-pkg-config
-
 HOST_ATK_CONF_OPT = \
 		--disable-glibtest
 
-- 
1.7.8.3
