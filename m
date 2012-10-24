From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Oct 2012 09:16:50 +0200
Subject: [Buildroot] [git commit] fs/skeleton: remove /etc/TZ
Message-ID: <20121024071711.0DF3599913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a61fbd82394f9bc9317535b717a2e1dd51dea7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Defaulting to UTC (which is what uClibc will default to when /etc/TZ is
missing) seems more sensible than US Mountain Time Zone in the default
rootfs skeleton.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/TZ |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/skeleton/etc/TZ b/fs/skeleton/etc/TZ
deleted file mode 100644
index 9fcb2a3..0000000
--- a/fs/skeleton/etc/TZ
+++ /dev/null
@@ -1 +0,0 @@
-MST7MDT
