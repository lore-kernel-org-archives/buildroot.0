From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:46 -0000
Subject: [Buildroot] [git commit branch/next] package: include
	package/skeleton/Config.in
Message-ID: <20150808105633.20B627FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1d25900ce56087b43ef6f0f7484d65ef5afdd10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This was missing from the patch introducing the skeleton package. It
was working fine, except that the skeleton package was not in the
global variable PACKAGES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0288cb0..5beb450 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,5 +1,6 @@
 menu "Target packages"
 
+	source "package/skeleton/Config.in"
 	source "package/busybox/Config.in"
 
 menu "Audio and video applications"
