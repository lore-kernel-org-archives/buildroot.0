From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  5 Oct 2013 21:49:10 +0200
Subject: [Buildroot] [PATCH 5/9] manual: configure: add deprecation warning
	for Crosstool-NG toolchain backend
In-Reply-To: <cover.1381002281.git.s.martin49@gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
Message-ID: <899fd3f5a8997619896f96becd6ff01f7f06921a.1381002281.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/configure.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 56b0469..5d6df88 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -246,6 +246,15 @@ Drawbacks of this backend:
 Crosstool-NG toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+[WARNING]
+The *_Crosstool-NG toolchain backend_ is deprecated* and its integration in
+Buildroot will be removed sooner or later.
+This deprecation is only due to the technical integration issues between
+Buildroot and http://crosstool-ng.org[Crosstool-NG] as a toolchain backend.
+Thus, *we highly recommend to use http://crosstool-ng.org[Crosstool-NG] to
+build the toolchain outside Buildroot, then use this toolchain as an _external
+toolchain_ in Buildroot* instead.
+
 The _Crosstool-NG toolchain backend_ integrates the
 http://crosstool-ng.org[Crosstool-NG] project with
 Buildroot. Crosstool-NG is a highly-configurable, versatile and
-- 
1.8.4
