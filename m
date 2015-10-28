From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:34:16 +0100
Subject: [Buildroot] [git commit] skeleton: add "operator" group
Message-ID: <20151028224140.CF60A81ED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78521ca8bd2f8b7722521e2e9055dd59b8d9fc54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gid 37 was referenced in /etc/passwd but not in /etc/group

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index ba20e90..c813da2 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -16,6 +16,7 @@ video:x:28:
 audio:x:29:
 tape:x:32:
 www-data:x:33:
+operator:x:37:
 utmp:x:43:
 plugdev:x:46:
 staff:x:50:
