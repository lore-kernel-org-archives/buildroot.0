From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:40:36 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libsigrok: add
 hash for license file
Message-ID: <20191031203354.A1C7B8E305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6105f6f8a227a446e6f40e65af85a3c2f1d847fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a5b5a725536d592fd6514e359115321a4f07e8e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/libsigrok.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigrok/libsigrok.hash b/package/libsigrok/libsigrok.hash
index 7a52c6ca1b..e5ab5d9736 100644
--- a/package/libsigrok/libsigrok.hash
+++ b/package/libsigrok/libsigrok.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256	e40fde7af98d29e922e9d3cbe0a6c0569889153fc31e47b8b1afe4d846292b9c	libsigrok-0.5.1.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
