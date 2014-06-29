From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 18:02:10 +0200
Subject: [Buildroot] [git commit] Add BR2_DEPRECATED_SINCE_2014_08
Message-ID: <20140629160243.1BE119D10A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f3508a4c827788ab220bed06b37bafb87bfa648
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the deprecation of certain features in 2014.08, add
the BR2_DEPRECATED_SINCE_2014_08 symbol.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index bf1ca86..50968fb 100644
--- a/Config.in
+++ b/Config.in
@@ -319,6 +319,10 @@ config BR2_DEPRECATED_SINCE_2014_05
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2014_08
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
