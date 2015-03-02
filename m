From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:16 -0000
Subject: [Buildroot] [git commit] glibc: fix version string for 2.21
Message-ID: <20150302222716.0490981764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=deb24160bf4085ee01b80464bbee376fe83abd84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 1cf2f56..3038b27 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -48,3 +48,4 @@ config BR2_GLIBC_VERSION_STRING
 	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
 	default "2.19" if BR2_GLIBC_VERSION_2_19
 	default "2.20" if BR2_GLIBC_VERSION_2_20
+	default "2.21" if BR2_GLIBC_VERSION_2_21
