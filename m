From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:51:45 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] boot/barebox: change
 download site to https
Message-ID: <20190124155056.7C3638E2B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7c0363e7eed279a04e06f15d4dc80c3c9f114c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2cf068864708285c6bc7cffffc38be17aa376c49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index b811e322b5..9e8a9f67b5 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -28,7 +28,7 @@ $(1)_SITE_METHOD = git
 else
 # Handle stable official Barebox versions
 $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
-$(1)_SITE = http://www.barebox.org/download
+$(1)_SITE = https://www.barebox.org/download
 endif
 
 $(1)_DEPENDENCIES = host-lzop
