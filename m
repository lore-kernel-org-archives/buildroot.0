From: marcus.osdoba at googlemail.com <marcus.osdoba@googlemail.com>
Date: Sat,  4 Sep 2010 15:54:21 +0200
Subject: [Buildroot] [PATCH] add directory buildroot-config to VCS ignore
	list
Message-ID: <1283608461-5675-1-git-send-email-Marcus.Osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcus Osdoba <marcus.osdoba@googlemail.com>

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 package/config/.gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/config/.gitignore b/package/config/.gitignore
index 1ea18a2..fbaa3e8 100644
--- a/package/config/.gitignore
+++ b/package/config/.gitignore
@@ -7,3 +7,4 @@
 /lex.zconf.c
 /zconf.hash.c
 /zconf.tab.c
+/buildroot-config
-- 
1.7.1
