From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  8 Jul 2010 22:11:54 +0200
Subject: [Buildroot] [PATCH] Fix a wrong sentence in the docs.
Message-ID: <1278619914-17785-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 docs/buildroot.html |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 48854de..6d4f17c 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1010,7 +1010,7 @@ $(eval $(call GENTARGETS,package,libfoo,host))
 
    <p>For the target package, the <code>GENTARGETS</code> uses the
    variables defined by the .mk file and prefixed by the uppercased
-   package name: <code>LIBFOO_*</code>. For target package, it uses
+   package name: <code>LIBFOO_*</code>. For the host package, it uses
    the <code>HOST_LIBFOO_*</code>. For <i>some</i> variables, if the
    <code>HOST_LIBFOO_</code> prefixed variable doesn't exist, the
    package infrastructure uses the corresponding variable prefixed by
-- 
1.7.0.4
