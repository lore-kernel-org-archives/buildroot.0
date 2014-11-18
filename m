From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 08:39:25 +0100
Subject: [Buildroot] [git commit] python-tornado: add zlib run-time
	dependency
Message-ID: <20141118074238.0B8DCB483D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b1393a04aa928cc9a5d2b5efd7d83bea7f5757b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tornado/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index c127d0e..870a3de 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_ZLIB
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
