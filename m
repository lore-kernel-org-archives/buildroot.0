From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 23 Feb 2014 14:05:48 +0100
Subject: [Buildroot] [PATCH] manual: Add a note for dependency comment format
Message-ID: <1393160748-14235-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a quick note to clarify that the format of the depencency comments
applies irregardless of the number of dependencies.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 3dc5395..b6dc981 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -205,6 +205,7 @@ aircrack-ng needs a toolchain w/ largefile, threads
 
 Note that this text is kept brief on purpose, so that it will fit on a
 80-character terminal.
+This format must be repected even if there is only one dependency.
 
 The rest of this section enumerates the different target and toolchain
 options, the corresponding config symbols to depend on, and the text to
-- 
1.8.5.3
