From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  3 Oct 2011 23:20:51 +0200
Subject: [Buildroot] [PATCH 15/22] xfont_encodings: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1317676858-3407-1-git-send-email-arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
 <1317676858-3407-1-git-send-email-arnout@mind.be>
Message-ID: <1317676858-3407-16-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 3bf7bc0..75abacc 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -10,7 +10,6 @@ XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_AUTORECONF = NO
 XFONT_ENCODINGS_MAKE_OPT =
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
-HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.6.3
