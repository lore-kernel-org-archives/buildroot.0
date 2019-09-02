From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 12:32:33 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/oniguruma: fix
 license hash
Message-ID: <20190902102839.02DEB88E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d9e1871b9e126e5a53fc0a04ee66c765ae13b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Year has been updated when bumping to 6.9.2:
https://github.com/kkos/oniguruma/commit/73ac6e6a236c12ff62f48e56da536b5c9a1c543b

Fixes:
 - http://autobuild.buildroot.org/results/551b3f12867e27b1a9f784099cad1e439d50089f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9372aea8f711221ccd79e75777a7e1ef1a181450)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oniguruma/oniguruma.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 0adbba167c..b6f1cc549d 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  3b568a9050839e7828b2f2d5bc9cd3650979b6b54a080f54c515320dddda06b0  oniguruma-6.9.2.tar.gz
-sha256  84e55812150474adf4170d4656744dfcc5f260ff7602e447a70bf13c56203e4b  COPYING
+sha256  ae266a1ad1c2ef50baf14a1a2993e926cd46d09c6cc8b0b3a8498e44da2746b8  COPYING
