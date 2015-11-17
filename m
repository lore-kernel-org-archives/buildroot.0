From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 21:59:31 +0100
Subject: [Buildroot] [git commit branch/next] skeleton: remove unused
	/etc/issue
Message-ID: <20151117205945.3A22281E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29d1f8d1b616fefeaf6a90590f64ea762eb09b41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

/etc/issue is managed with BR2_TARGET_GENERIC_ISSUE. In case
BR2_TARGET_GENERIC_ISSUE is set (which is default), /etc/issue
is overwritten. In case BR2_TARGET_GENERIC_ISSUE is not set,
we don't want /etc/issue exist.

Finaly, remove /etc/issue from skeleton.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/issue |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/system/skeleton/etc/issue b/system/skeleton/etc/issue
deleted file mode 100644
index 90f1779..0000000
--- a/system/skeleton/etc/issue
+++ /dev/null
@@ -1,3 +0,0 @@
-
-Welcome to Buildroot
-
