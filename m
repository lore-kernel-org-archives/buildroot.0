From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:30:44 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/bind: fix license
 hash
Message-ID: <20210227181918.295788624F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5812f3e52b841dc9de08986338369dd2621d70b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 9679d3f0218519ea7a01f3b5fefb7f6dd23b138e forgot to update hash of
COPYRIGHT which was updated to replace http by https:
https://gitlab.isc.org/isc-projects/bind9/-/commit/400171aee8db87c3973987980327051a58a20a80

Fixes:
 - http://autobuild.buildroot.org/results/db614a6fa1e17af2fa5c1d4a0d51cdf770893ca9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ac6dbae320231a02e1b9b69c8c9250e6854aaaa9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index e02c06ff3e..cbd9562b56 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
 # Verified from https://ftp.isc.org/isc/bind9/9.11.24/bind-9.11.24.tar.gz.asc
 # with key 95CEDA256B1CA0A15F302FB59521A7ED5DACE918
 sha256  f261587c5d37c7f14e8393547c4556faefa701a646930f1b6408d71519a30428  bind-9.11.24.tar.gz
-sha256  da2aec2b7f6f0feb16bcb080e2c587375fd3195145f047e4d92d112f5b9db501  COPYRIGHT
+sha256  e316d9d12b3cc3600985d71011d7856f5ff93d28e748155a3a18171b32d98d8b  COPYRIGHT
