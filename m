From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 28 Mar 2014 19:48:34 +0100
Subject: [Buildroot] [PATCH] manual: Add singular example for dependency
	comment
Message-ID: <1396032514-10807-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual always uses the format with multiple dependencies. This only
add an example where is a single dependency to show that this format is
applicable regardless of the number of dependencies.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index e56e59a..52eb653 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -202,6 +202,10 @@ for example:
 --------------------------
 aircrack-ng needs a toolchain w/ largefile, threads
 --------------------------
+or
+--------------------------
+crda needs a toolchain w/ threads
+--------------------------
 
 Note that this text is kept brief on purpose, so that it will fit on a
 80-character terminal.
-- 
1.9.0
