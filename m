From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:52 -0000
Subject: [Buildroot] [git commit branch/next] ntp: drop unused
	POST_PATCH_HOOKS handling
Message-ID: <20150808105622.B75BC7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f2bb5504fdf6fb61823463271a0efcf783a5866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
