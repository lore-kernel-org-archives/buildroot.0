From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 17:07:23 +0100
Subject: [Buildroot] [git commit] packages: re-categorize gmp, mpc and mpfr
Message-ID: <20130319160723.8BC9B9B030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae04535e5e5f67874dfaddab1128fe5e76e549fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They're not development tools, they're libraries, so place them under
libraries->other.
Also adjust gsl sort order.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e12228f..94e279b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -72,15 +72,12 @@ source "package/gawk/Config.in"
 endif
 source "toolchain/gcc/Config.in.2"
 source "package/gettext/Config.in"
-source "package/gmp/Config.in"
 source "package/gperf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
 endif
 source "package/intltool/Config.in"
 source "package/make/Config.in"
-source "package/mpc/Config.in"
-source "package/mpfr/Config.in"
 source "package/libtool/Config.in"
 source "package/m4/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -549,6 +546,8 @@ source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
+source "package/gmp/Config.in"
+source "package/gsl/Config.in"
 source "package/gtest/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
@@ -558,7 +557,6 @@ source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
-source "package/gsl/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
@@ -570,6 +568,8 @@ source "package/libseccomp/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
 source "package/lttng-libust/Config.in"
+source "package/mpc/Config.in"
+source "package/mpfr/Config.in"
 source "package/mtdev2tuio/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
