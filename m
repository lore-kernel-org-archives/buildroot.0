From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Feb 2016 22:00:43 +0100
Subject: [Buildroot] [git commit] CHANGES: Add note about the recent linux
	timeconst.pl patch feature
Message-ID: <20160229210158.2B1CC804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d1d6ddd1bb03b16ceba45e5ea4d6b3e386bde96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was added just before -rc1, but was forgotten in CHANGES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CHANGES b/CHANGES
index d54feb2..a4e22f8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -67,6 +67,11 @@
 	A number of defconfigs have been extended to generate complete
 	system images using genimage.
 
+	Linux: Authomatically patch timeconst.pl for <3.9 kernels,
+	which isn't compatible with modern perl versions, breaking the
+	build when building on recent (Fedora 23, Debian
+	Testing/Unstable, ..) distributions.
+
 	Makedevs utility now accepts textual (non-numerical) user and
 	group names.
 
