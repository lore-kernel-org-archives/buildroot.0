From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Dec 2019 22:09:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/sdl_mixer: add hash for license file
In-Reply-To: <20191230210953.1144882-1-fontaine.fabrice@gmail.com>
References: <20191230210953.1144882-1-fontaine.fabrice@gmail.com>
Message-ID: <20191230210953.1144882-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl_mixer/sdl_mixer.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl_mixer/sdl_mixer.hash b/package/sdl_mixer/sdl_mixer.hash
index cfe8b07cb0..5d7e7836cd 100644
--- a/package/sdl_mixer/sdl_mixer.hash
+++ b/package/sdl_mixer/sdl_mixer.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a	SDL_mixer-1.2.12.tar.gz
+sha256	bc4c3bc32b311044d81c32b5e5402a6bc971a3b235850bb63445ec14bb6fe59e	COPYING
-- 
2.24.0
