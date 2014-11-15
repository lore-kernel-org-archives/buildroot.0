From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 15 Nov 2014 17:29:21 +0100
Subject: [Buildroot] [PATCH 6/9] manual: Add newline before block code
In-Reply-To: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1416068964-22529-6-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This won't change the output, it's only a style issue.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c145829..0ea03f9 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -191,15 +191,19 @@ construct rather than repeating the +depends on+ statement on the
 comment and other config options.
 
 The general format of a dependency +comment+ for package foo is:
+
 --------------------------
 foo needs a toolchain w/ featA, featB, featC
 --------------------------
 
 for example:
+
 --------------------------
 aircrack-ng needs a toolchain w/ largefile, threads
 --------------------------
+
 or
+
 --------------------------
 crda needs a toolchain w/ threads
 --------------------------
@@ -283,6 +287,7 @@ foo needs a Linux kernel to be built
 
 If there is a dependency on both toolchain options and the Linux
 kernel, use this format:
+
 --------------------------
 foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
 --------------------------
-- 
2.1.3
