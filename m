From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  3 Oct 2011 23:20:45 +0200
Subject: [Buildroot] [PATCH 09/22] squashfs3: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1317676858-3407-1-git-send-email-arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
 <1317676858-3407-1-git-send-email-arnout@mind.be>
Message-ID: <1317676858-3407-10-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/squashfs3/squashfs3.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 178543b..81cdf79 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -3,7 +3,6 @@ SQUASHFS3_SOURCE=squashfs$(SQUASHFS3_VERSION).tar.gz
 SQUASHFS3_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
 
 SQUASHFS3_DEPENDENCIES = zlib
-HOST_SQUASHFS3_DEPENDENCIES = host-zlib
 
 define SQUASHFS3_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE)    \
-- 
1.7.6.3
