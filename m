From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 14:11:03 +0100
Subject: [Buildroot] [git commit] tcl: add license information
Message-ID: <20130324133025.5FE079B26E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47d62c9097fb15a500d885aaeca7cbfe93db05b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Davide Viti <zinosat@tiscali.it>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcl/tcl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 606042e..ec089ee 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -8,6 +8,8 @@ TCL_VERSION_MINOR = 19
 TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
+TCL_LICENSE = tcl license
+TCL_LICENSE_FILE = license.terms
 TCL_SUBDIR = unix
 TCL_CONF_OPT = \
 		--disable-symbols \
