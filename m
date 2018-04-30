From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 22:38:03 +0200
Subject: [Buildroot] [PATCH 1/1] libid3tag: add hash for license files
Message-ID: <20180430203803.17107-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libid3tag/libid3tag.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libid3tag/libid3tag.hash b/package/libid3tag/libid3tag.hash
index fb02882db7..82ad59d9ac 100644
--- a/package/libid3tag/libid3tag.hash
+++ b/package/libid3tag/libid3tag.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256  63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151  libid3tag-0.15.1b.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  7f12ad28dc075763e91b91bfa60fad04062380011ddad8f6bac21dd7b1f44367  COPYRIGHT
-- 
2.14.1
