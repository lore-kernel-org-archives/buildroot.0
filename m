From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Aug 2009 15:30:51 +0200
Subject: [Buildroot] [git commit master] sdl_net: use sdl_net instead of
	SDL_net as make target
Message-ID: <20090828133243.46D3E77742@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=688c388ce765984af224155feb465edbb02468d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Julien Boibessot <julien.boibessot@free.fr>.

The other SDL extensions use sdl_xx, and not SDL_xx, so rename sdl_net
to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sdl_net/sdl_net.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index b4ef45c..7b7e12a 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -14,4 +14,4 @@ SDL_NET_INSTALL_STAGING = YES
 
 SDL_NET_DEPENDENCIES = sdl
 
-$(eval $(call AUTOTARGETS,package,SDL_net))
+$(eval $(call AUTOTARGETS,package,sdl_net))
-- 
1.6.3.3
