From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Sep 2014 22:46:12 +0200
Subject: [Buildroot] [PATCH 2/2] docs: really move the website
In-Reply-To: <cover.1411591300.git.yann.morin.1998@free.fr>
References: <cover.1411591300.git.yann.morin.1998@free.fr>
Message-ID: <e3175e7a9fa2832f59ba0efecc786457a01e92d8.1411591300.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the automated scripts that deply our website have been updated,
really move the website to its final location.

We still keep a symlink for the images, as they are used both for the
website, and for the manual.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Since we do not have much flexibility with the automated scripts, I
preferred the images be stored in the website so it is easier to deploy.
---
 docs/images                                              |   1 +
 docs/website                                             |   1 -
 docs/{ => website}/about.html                            |   0
 docs/{ => website}/contribute.html                       |   0
 docs/{ => website}/copyright.txt                         |   0
 docs/{ => website}/css/bootstrap-responsive.css          |   0
 docs/{ => website}/css/bootstrap-responsive.min.css      |   0
 docs/{ => website}/css/bootstrap.css                     |   0
 docs/{ => website}/css/bootstrap.min.css                 |   0
 docs/{ => website}/css/bootswatch.less                   |   0
 docs/{ => website}/css/buildroot.css                     |   0
 docs/{ => website}/css/variables.less                    |   0
 docs/{ => website}/docs.html                             |   0
 docs/{ => website}/download.html                         |   0
 docs/{ => website}/favicon.ico                           | Bin
 docs/{ => website}/footer.html                           |   0
 docs/{ => website}/git.html                              |   0
 docs/{ => website}/header.html                           |   0
 docs/{ => website}/images/boundary-devices-logo.png      | Bin
 docs/{ => website}/images/calao-logo.png                 | Bin
 docs/{ => website}/images/circuitco-logo.png             | Bin
 docs/{ => website}/images/fluendo-logo.png               | Bin
 docs/{ => website}/images/free-electrons-logo.png        | Bin
 docs/{ => website}/images/glyphicons-halflings-white.png | Bin
 docs/{ => website}/images/glyphicons-halflings.png       | Bin
 docs/{ => website}/images/google-logo.png                | Bin
 docs/{ => website}/images/gplus.png                      | Bin
 docs/{ => website}/images/imgtec-logo.png                | Bin
 docs/{ => website}/images/logo.png                       | Bin
 docs/{ => website}/images/logo.xcf                       | Bin
 docs/{ => website}/images/logo_small.png                 | Bin
 docs/{ => website}/images/menuconfig.png                 | Bin
 docs/{ => website}/images/menuconfig_small.png           | Bin
 docs/{ => website}/images/mind-logo.png                  | Bin
 docs/{ => website}/images/synopsys-logo.png              | Bin
 docs/{ => website}/images/valid-html401.png              | Bin
 docs/{ => website}/index.html                            |   0
 docs/{ => website}/js/bootstrap.js                       |   0
 docs/{ => website}/js/bootstrap.min.js                   |   0
 docs/{ => website}/js/buildroot.js                       |   0
 docs/{ => website}/js/jquery-1.10.2.min.js               |   0
 docs/{ => website}/news.html                             |   0
 docs/{ => website}/robots.txt                            |   0
 docs/{ => website}/sponsors.html                         |   0
 docs/{ => website}/support.html                          |   0
 45 files changed, 1 insertion(+), 1 deletion(-)
 create mode 120000 docs/images
 delete mode 120000 docs/website
 rename docs/{ => website}/about.html (100%)
 rename docs/{ => website}/contribute.html (100%)
 rename docs/{ => website}/copyright.txt (100%)
 rename docs/{ => website}/css/bootstrap-responsive.css (100%)
 rename docs/{ => website}/css/bootstrap-responsive.min.css (100%)
 rename docs/{ => website}/css/bootstrap.css (100%)
 rename docs/{ => website}/css/bootstrap.min.css (100%)
 rename docs/{ => website}/css/bootswatch.less (100%)
 rename docs/{ => website}/css/buildroot.css (100%)
 rename docs/{ => website}/css/variables.less (100%)
 rename docs/{ => website}/docs.html (100%)
 rename docs/{ => website}/download.html (100%)
 rename docs/{ => website}/favicon.ico (100%)
 rename docs/{ => website}/footer.html (100%)
 rename docs/{ => website}/git.html (100%)
 rename docs/{ => website}/header.html (100%)
 rename docs/{ => website}/images/boundary-devices-logo.png (100%)
 rename docs/{ => website}/images/calao-logo.png (100%)
 rename docs/{ => website}/images/circuitco-logo.png (100%)
 rename docs/{ => website}/images/fluendo-logo.png (100%)
 rename docs/{ => website}/images/free-electrons-logo.png (100%)
 rename docs/{ => website}/images/glyphicons-halflings-white.png (100%)
 rename docs/{ => website}/images/glyphicons-halflings.png (100%)
 rename docs/{ => website}/images/google-logo.png (100%)
 rename docs/{ => website}/images/gplus.png (100%)
 rename docs/{ => website}/images/imgtec-logo.png (100%)
 rename docs/{ => website}/images/logo.png (100%)
 rename docs/{ => website}/images/logo.xcf (100%)
 rename docs/{ => website}/images/logo_small.png (100%)
 rename docs/{ => website}/images/menuconfig.png (100%)
 rename docs/{ => website}/images/menuconfig_small.png (100%)
 rename docs/{ => website}/images/mind-logo.png (100%)
 rename docs/{ => website}/images/synopsys-logo.png (100%)
 rename docs/{ => website}/images/valid-html401.png (100%)
 rename docs/{ => website}/index.html (100%)
 rename docs/{ => website}/js/bootstrap.js (100%)
 rename docs/{ => website}/js/bootstrap.min.js (100%)
 rename docs/{ => website}/js/buildroot.js (100%)
 rename docs/{ => website}/js/jquery-1.10.2.min.js (100%)
 rename docs/{ => website}/news.html (100%)
 rename docs/{ => website}/robots.txt (100%)
 rename docs/{ => website}/sponsors.html (100%)
 rename docs/{ => website}/support.html (100%)

diff --git a/docs/images b/docs/images
new file mode 120000
index 0000000..7356350
--- /dev/null
+++ b/docs/images
@@ -0,0 +1 @@
+website/images
\ No newline at end of file
diff --git a/docs/website b/docs/website
deleted file mode 120000
index 945c9b4..0000000
--- a/docs/website
+++ /dev/null
@@ -1 +0,0 @@
-.
\ No newline at end of file
diff --git a/docs/about.html b/docs/website/about.html
similarity index 100%
rename from docs/about.html
rename to docs/website/about.html
diff --git a/docs/contribute.html b/docs/website/contribute.html
similarity index 100%
rename from docs/contribute.html
rename to docs/website/contribute.html
diff --git a/docs/copyright.txt b/docs/website/copyright.txt
similarity index 100%
rename from docs/copyright.txt
rename to docs/website/copyright.txt
diff --git a/docs/css/bootstrap-responsive.css b/docs/website/css/bootstrap-responsive.css
similarity index 100%
rename from docs/css/bootstrap-responsive.css
rename to docs/website/css/bootstrap-responsive.css
diff --git a/docs/css/bootstrap-responsive.min.css b/docs/website/css/bootstrap-responsive.min.css
similarity index 100%
rename from docs/css/bootstrap-responsive.min.css
rename to docs/website/css/bootstrap-responsive.min.css
diff --git a/docs/css/bootstrap.css b/docs/website/css/bootstrap.css
similarity index 100%
rename from docs/css/bootstrap.css
rename to docs/website/css/bootstrap.css
diff --git a/docs/css/bootstrap.min.css b/docs/website/css/bootstrap.min.css
similarity index 100%
rename from docs/css/bootstrap.min.css
rename to docs/website/css/bootstrap.min.css
diff --git a/docs/css/bootswatch.less b/docs/website/css/bootswatch.less
similarity index 100%
rename from docs/css/bootswatch.less
rename to docs/website/css/bootswatch.less
diff --git a/docs/css/buildroot.css b/docs/website/css/buildroot.css
similarity index 100%
rename from docs/css/buildroot.css
rename to docs/website/css/buildroot.css
diff --git a/docs/css/variables.less b/docs/website/css/variables.less
similarity index 100%
rename from docs/css/variables.less
rename to docs/website/css/variables.less
diff --git a/docs/docs.html b/docs/website/docs.html
similarity index 100%
rename from docs/docs.html
rename to docs/website/docs.html
diff --git a/docs/download.html b/docs/website/download.html
similarity index 100%
rename from docs/download.html
rename to docs/website/download.html
diff --git a/docs/favicon.ico b/docs/website/favicon.ico
similarity index 100%
rename from docs/favicon.ico
rename to docs/website/favicon.ico
diff --git a/docs/footer.html b/docs/website/footer.html
similarity index 100%
rename from docs/footer.html
rename to docs/website/footer.html
diff --git a/docs/git.html b/docs/website/git.html
similarity index 100%
rename from docs/git.html
rename to docs/website/git.html
diff --git a/docs/header.html b/docs/website/header.html
similarity index 100%
rename from docs/header.html
rename to docs/website/header.html
diff --git a/docs/images/boundary-devices-logo.png b/docs/website/images/boundary-devices-logo.png
similarity index 100%
rename from docs/images/boundary-devices-logo.png
rename to docs/website/images/boundary-devices-logo.png
diff --git a/docs/images/calao-logo.png b/docs/website/images/calao-logo.png
similarity index 100%
rename from docs/images/calao-logo.png
rename to docs/website/images/calao-logo.png
diff --git a/docs/images/circuitco-logo.png b/docs/website/images/circuitco-logo.png
similarity index 100%
rename from docs/images/circuitco-logo.png
rename to docs/website/images/circuitco-logo.png
diff --git a/docs/images/fluendo-logo.png b/docs/website/images/fluendo-logo.png
similarity index 100%
rename from docs/images/fluendo-logo.png
rename to docs/website/images/fluendo-logo.png
diff --git a/docs/images/free-electrons-logo.png b/docs/website/images/free-electrons-logo.png
similarity index 100%
rename from docs/images/free-electrons-logo.png
rename to docs/website/images/free-electrons-logo.png
diff --git a/docs/images/glyphicons-halflings-white.png b/docs/website/images/glyphicons-halflings-white.png
similarity index 100%
rename from docs/images/glyphicons-halflings-white.png
rename to docs/website/images/glyphicons-halflings-white.png
diff --git a/docs/images/glyphicons-halflings.png b/docs/website/images/glyphicons-halflings.png
similarity index 100%
rename from docs/images/glyphicons-halflings.png
rename to docs/website/images/glyphicons-halflings.png
diff --git a/docs/images/google-logo.png b/docs/website/images/google-logo.png
similarity index 100%
rename from docs/images/google-logo.png
rename to docs/website/images/google-logo.png
diff --git a/docs/images/gplus.png b/docs/website/images/gplus.png
similarity index 100%
rename from docs/images/gplus.png
rename to docs/website/images/gplus.png
diff --git a/docs/images/imgtec-logo.png b/docs/website/images/imgtec-logo.png
similarity index 100%
rename from docs/images/imgtec-logo.png
rename to docs/website/images/imgtec-logo.png
diff --git a/docs/images/logo.png b/docs/website/images/logo.png
similarity index 100%
rename from docs/images/logo.png
rename to docs/website/images/logo.png
diff --git a/docs/images/logo.xcf b/docs/website/images/logo.xcf
similarity index 100%
rename from docs/images/logo.xcf
rename to docs/website/images/logo.xcf
diff --git a/docs/images/logo_small.png b/docs/website/images/logo_small.png
similarity index 100%
rename from docs/images/logo_small.png
rename to docs/website/images/logo_small.png
diff --git a/docs/images/menuconfig.png b/docs/website/images/menuconfig.png
similarity index 100%
rename from docs/images/menuconfig.png
rename to docs/website/images/menuconfig.png
diff --git a/docs/images/menuconfig_small.png b/docs/website/images/menuconfig_small.png
similarity index 100%
rename from docs/images/menuconfig_small.png
rename to docs/website/images/menuconfig_small.png
diff --git a/docs/images/mind-logo.png b/docs/website/images/mind-logo.png
similarity index 100%
rename from docs/images/mind-logo.png
rename to docs/website/images/mind-logo.png
diff --git a/docs/images/synopsys-logo.png b/docs/website/images/synopsys-logo.png
similarity index 100%
rename from docs/images/synopsys-logo.png
rename to docs/website/images/synopsys-logo.png
diff --git a/docs/images/valid-html401.png b/docs/website/images/valid-html401.png
similarity index 100%
rename from docs/images/valid-html401.png
rename to docs/website/images/valid-html401.png
diff --git a/docs/index.html b/docs/website/index.html
similarity index 100%
rename from docs/index.html
rename to docs/website/index.html
diff --git a/docs/js/bootstrap.js b/docs/website/js/bootstrap.js
similarity index 100%
rename from docs/js/bootstrap.js
rename to docs/website/js/bootstrap.js
diff --git a/docs/js/bootstrap.min.js b/docs/website/js/bootstrap.min.js
similarity index 100%
rename from docs/js/bootstrap.min.js
rename to docs/website/js/bootstrap.min.js
diff --git a/docs/js/buildroot.js b/docs/website/js/buildroot.js
similarity index 100%
rename from docs/js/buildroot.js
rename to docs/website/js/buildroot.js
diff --git a/docs/js/jquery-1.10.2.min.js b/docs/website/js/jquery-1.10.2.min.js
similarity index 100%
rename from docs/js/jquery-1.10.2.min.js
rename to docs/website/js/jquery-1.10.2.min.js
diff --git a/docs/news.html b/docs/website/news.html
similarity index 100%
rename from docs/news.html
rename to docs/website/news.html
diff --git a/docs/robots.txt b/docs/website/robots.txt
similarity index 100%
rename from docs/robots.txt
rename to docs/website/robots.txt
diff --git a/docs/sponsors.html b/docs/website/sponsors.html
similarity index 100%
rename from docs/sponsors.html
rename to docs/website/sponsors.html
diff --git a/docs/support.html b/docs/website/support.html
similarity index 100%
rename from docs/support.html
rename to docs/website/support.html
-- 
1.9.1
