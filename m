From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 23:07:01 +0100
Subject: [Buildroot] [git commit] Config.in: remove text denoting central
	package infra
Message-ID: <20150219220708.254F6817B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f3fdb853491c198f9f95c77a56a79cdf427a4a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The central package infrastructure handles all packages for quite some time
now, so this note is no longer needed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index f5b6c73..ce239d6 100644
--- a/Config.in
+++ b/Config.in
@@ -167,8 +167,6 @@ config BR2_PRIMARY_SITE
 	  default if the file is not found.
 	  Valid URIs are URIs recognized by $(WGET) and scp URIs of the form
 	  scp://[user@]host:path.
-	  NOTE: This works for all packages using the central package
-	  infrastructure (generic, autotools, cmake, ...)
 
 config BR2_PRIMARY_SITE_ONLY
 	bool "Only allow downloads from primary download site"
