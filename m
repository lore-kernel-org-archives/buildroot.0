From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 21:56:39 +0200
Subject: [Buildroot] [git commit] python external modules: reorder menu entry
Message-ID: <20130710202004.2EE809A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21d77aa3fedbfcc08421d41c8393611ebe7e0e39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reorder the external python modules menu entry so that it belongs under
python(2) and not under python3 to avoid confusion.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3186bb7..8039834 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,7 +344,6 @@ endmenu
 endif
 source "package/php/Config.in"
 source "package/python/Config.in"
-source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
@@ -362,6 +361,7 @@ source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
 endmenu
 endif
+source "package/python3/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
