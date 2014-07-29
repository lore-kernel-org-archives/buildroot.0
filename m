From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:32:41 +0200
Subject: [Buildroot] [git commit] popt: now needs gettextize
Message-ID: <20140729213256.2E9AF9D321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7eb4a73cee049339527e2df504afaeb478292c56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because of df9244ff3738face50605eacf4d4f15d963de915 we now need to
gettextize popt. Fixes:
http://autobuild.buildroot.net/results/6e2/6e27c98407f114df07eb5cd16a843420fdb72bf4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/popt/popt.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 0413c5a..54e7c88 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -11,6 +11,7 @@ POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
 POPT_AUTORECONF = YES
+POPT_GETTEXTIZE = YES
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
