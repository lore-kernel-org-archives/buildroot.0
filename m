From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 20:13:44 +0100
Subject: [Buildroot] [git commit master 1/1] Remove more or less inexact
	option concerning custom target skeleton
Message-ID: <20110130191406.290A98E261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2eefd74b0de9a6421ea46c71d908736537446fbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We discourage the addition of custom target skeleton into the official
Buildroot tree, so let's not encourage users to do this in the
documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 6226c11..1ec707d 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -346,10 +346,6 @@
       the contents of the skeleton are copied to output/target before
       any package installation.</li>
 
-      <li>Add support for your own target in Buildroot, so that you
-      have your own target skeleton (see <a href="#board_support">this
-      section</a> for details).</li>
-
       <li>In the Buildroot configuration, you can specify the path to a
       post-build script, that gets called <i>after</i> Buildroot builds all
       the selected software, but <i>before</i> the rootfs packages are
-- 
1.7.3.4
