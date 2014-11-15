From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 15 Nov 2014 17:29:20 +0100
Subject: [Buildroot] [PATCH 5/9] manual: Add missing vim header
In-Reply-To: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1416068964-22529-5-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/customize-outside-br.txt | 1 +
 docs/manual/customize-patches.txt    | 1 +
 docs/manual/makeusers-syntax.txt     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 1109843..5d63e60 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc -*- ;
+// vim: set syntax=asciidoc:
 
 [[outside-br-custom]]
 === Keeping customizations outside of Buildroot
diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
index a052915..e129a64 100644
--- a/docs/manual/customize-patches.txt
+++ b/docs/manual/customize-patches.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc -*- ;
+// vim: set syntax=asciidoc:
 
 [[customize-patches]]
 === Adding project-specific patches
diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index ecf3eb0..ffdb961 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc -*- ;
+// vim: set syntax=asciidoc:
 
 [[makeuser-syntax]]
 == Makeusers syntax documentation
-- 
2.1.3
