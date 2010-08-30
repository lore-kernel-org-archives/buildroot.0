From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Aug 2010 12:10:40 +0200
Subject: [Buildroot] [git commit master 1/1] docs/images: optimize small
	images to speed up page loading
Message-ID: <20100830101433.D0BA88A32A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a08538fd5ae51d2763c6622c1cc3f370e5956007
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove alpha channel and limit number of colors used. This gets the images
down to ~37% of their previous size without any visual degrading (in fact
it now looks correctly on ancient IE versions with broken png alpha
handling).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/images/logo_small.png       |  Bin 14743 -> 3624 bytes
 docs/images/menuconfig_small.png |  Bin 18284 -> 8604 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/docs/images/logo_small.png b/docs/images/logo_small.png
index cee1567..eab9540 100644
Binary files a/docs/images/logo_small.png and b/docs/images/logo_small.png differ
diff --git a/docs/images/menuconfig_small.png b/docs/images/menuconfig_small.png
index fded898..dffddfa 100644
Binary files a/docs/images/menuconfig_small.png and b/docs/images/menuconfig_small.png differ
-- 
1.7.1
