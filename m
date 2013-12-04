From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 22:06:20 +0100
Subject: [Buildroot] [git commit] python-pygame: rename package's Config.in
	bool
Message-ID: <20131204210742.BA9649BF16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f17020eb8579cdc5da269c17aeacef42479f2a53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pygame/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index 1b0a8b9..b9a367d 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYGAME
-	bool "pygame"
+	bool "python-pygame"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_SDL
 	help
