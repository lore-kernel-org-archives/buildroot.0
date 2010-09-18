From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 19:59:49 +0200
Subject: [Buildroot] [PATCH 7/7] gstreamer: allow autoreconfigure with
	gettext 0.18
In-Reply-To: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
References: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284832789-22631-8-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <lionel.landwerlin@pace.com>

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
---
 ...-bad-0.10.14-request-gettext-version-0.18.patch |   26 ++++++++++++++++++++
 ...base-0.10.25-request-gettext-version-0.18.patch |   26 ++++++++++++++++++++
 ...good-0.10.16-request-gettext-version-0.18.patch |   26 ++++++++++++++++++++
 ...ugly-0.10.10-Request-gettext-version-0.18.patch |   26 ++++++++++++++++++++
 ...amer-0.10.25-request-gettext-version-0.18.patch |   26 ++++++++++++++++++++
 5 files changed, 130 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-plugins-bad/gst-plugins-bad-0.10.14-request-gettext-version-0.18.patch
 create mode 100644 package/multimedia/gst-plugins-base/gst-plugins-base-0.10.25-request-gettext-version-0.18.patch
 create mode 100644 package/multimedia/gst-plugins-good/gst-plugins-good-0.10.16-request-gettext-version-0.18.patch
 create mode 100644 package/multimedia/gst-plugins-ugly/gst-plugins-ugly-0.10.10-Request-gettext-version-0.18.patch
 create mode 100644 package/multimedia/gstreamer/gstreamer-0.10.25-request-gettext-version-0.18.patch

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad-0.10.14-request-gettext-version-0.18.patch b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0.10.14-request-gettext-version-0.18.patch
new file mode 100644
index 0000000..3248e74
--- /dev/null
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad-0.10.14-request-gettext-version-0.18.patch
@@ -0,0 +1,26 @@
+From 3e79e82708ef31281eadbce303f934f126f4c3a0 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Fri, 17 Sep 2010 12:39:46 +0200
+Subject: [PATCH] Request gettext version 0.18
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4a3c041..30362f9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,7 +63,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I common/m4 -I .")
+ 
+ dnl set up gettext
+ dnl the version check needs to stay here because autopoint greps for it
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ AG_GST_GETTEXT([gstreamer-$GST_MAJORMINOR])
+ 
+-- 
+1.6.0.6
+
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.25-request-gettext-version-0.18.patch b/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.25-request-gettext-version-0.18.patch
new file mode 100644
index 0000000..3248e74
--- /dev/null
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base-0.10.25-request-gettext-version-0.18.patch
@@ -0,0 +1,26 @@
+From 3e79e82708ef31281eadbce303f934f126f4c3a0 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Fri, 17 Sep 2010 12:39:46 +0200
+Subject: [PATCH] Request gettext version 0.18
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4a3c041..30362f9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,7 +63,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I common/m4 -I .")
+ 
+ dnl set up gettext
+ dnl the version check needs to stay here because autopoint greps for it
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ AG_GST_GETTEXT([gstreamer-$GST_MAJORMINOR])
+ 
+-- 
+1.6.0.6
+
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good-0.10.16-request-gettext-version-0.18.patch b/package/multimedia/gst-plugins-good/gst-plugins-good-0.10.16-request-gettext-version-0.18.patch
new file mode 100644
index 0000000..3248e74
--- /dev/null
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good-0.10.16-request-gettext-version-0.18.patch
@@ -0,0 +1,26 @@
+From 3e79e82708ef31281eadbce303f934f126f4c3a0 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Fri, 17 Sep 2010 12:39:46 +0200
+Subject: [PATCH] Request gettext version 0.18
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4a3c041..30362f9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,7 +63,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I common/m4 -I .")
+ 
+ dnl set up gettext
+ dnl the version check needs to stay here because autopoint greps for it
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ AG_GST_GETTEXT([gstreamer-$GST_MAJORMINOR])
+ 
+-- 
+1.6.0.6
+
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly-0.10.10-Request-gettext-version-0.18.patch b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly-0.10.10-Request-gettext-version-0.18.patch
new file mode 100644
index 0000000..5f611f3
--- /dev/null
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly-0.10.10-Request-gettext-version-0.18.patch
@@ -0,0 +1,26 @@
+From 2699fdb8c52e2e1f86e8682c09d2fe2cf0494d42 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Fri, 17 Sep 2010 16:33:05 +0200
+Subject: [PATCH] Request gettext version 0.18
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0bc29c1..0876781 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,7 +60,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I m4 -I common/m4")
+ 
+ dnl set up gettext
+ dnl the version check needs to stay here because autopoint greps for it
+-AM_GNU_GETTEXT_VERSION(0.11.5)
++AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ AG_GST_GETTEXT([gst-plugins-ugly-$GST_MAJORMINOR])
+ 
+-- 
+1.6.0.6
+
diff --git a/package/multimedia/gstreamer/gstreamer-0.10.25-request-gettext-version-0.18.patch b/package/multimedia/gstreamer/gstreamer-0.10.25-request-gettext-version-0.18.patch
new file mode 100644
index 0000000..3248e74
--- /dev/null
+++ b/package/multimedia/gstreamer/gstreamer-0.10.25-request-gettext-version-0.18.patch
@@ -0,0 +1,26 @@
+From 3e79e82708ef31281eadbce303f934f126f4c3a0 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Fri, 17 Sep 2010 12:39:46 +0200
+Subject: [PATCH] Request gettext version 0.18
+
+Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4a3c041..30362f9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,7 +63,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I common/m4 -I .")
+ 
+ dnl set up gettext
+ dnl the version check needs to stay here because autopoint greps for it
+-AM_GNU_GETTEXT_VERSION([0.17])
++AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ AG_GST_GETTEXT([gstreamer-$GST_MAJORMINOR])
+ 
+-- 
+1.6.0.6
+
-- 
1.7.1
