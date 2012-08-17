From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 17:47:40 +0200
Subject: [Buildroot] [git commit branch/next] gsl: fix space instead of tab
	in Config.in
Message-ID: <20120817154924.72ACB971EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d74cff9b88509bb11c5ad44bd2b3f870c821273
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gsl/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gsl/Config.in b/package/gsl/Config.in
index 92541da..aa431d1 100644
--- a/package/gsl/Config.in
+++ b/package/gsl/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_GSL
 	  special functions and least-squares fitting. There are over
 	  1000 functions in total with an extensive test suite.
 
- 	  http://www.gnu.org/software/gsl
+	  http://www.gnu.org/software/gsl
