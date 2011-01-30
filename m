From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:37:47 +0100
Subject: [Buildroot] [PATCH 3/6] Remove more or less inexact option
	concerning custom target skeleton
In-Reply-To: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
References: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7fbe5e26bfcd222cc0247b35944d1dd5277738de.1296398261.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We discourage the addition of custom target skeleton into the official
Buildroot tree, so let's not encourage users to do this in the
documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index c4508f2..1b8da2a 100644
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
1.7.0.4
