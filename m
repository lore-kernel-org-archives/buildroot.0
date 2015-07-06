From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jul 2015 14:20:30 +0200
Subject: [Buildroot] [git commit] ntp: drop unused POST_PATCH_HOOKS handling
Message-ID: <20150706122157.6D00180E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f2bb5504fdf6fb61823463271a0efcf783a5866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that NTP_PATCH_FIXUPS is gone.

Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 110eaf8..5997247 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -69,6 +69,4 @@ define NTP_INSTALL_INIT_SYSTEMD
 endef
 endif
 
-NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
-
 $(eval $(autotools-package))
