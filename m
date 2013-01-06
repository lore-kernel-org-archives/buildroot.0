From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:39 +0100
Subject: [Buildroot] [PATCH 27/28] xvkbd: remove version from the patch file
	name
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <762fca35a84063530340986cd964299694fec0d2.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The version in xvkbd patch file name doesn't patch the version of the
package, so use the new convention that consists in not having the
package version in the patch file names.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...kbd-2.8-makefile.patch => xvkbd-makefile.patch} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/xvkbd/{xvkbd-2.8-makefile.patch => xvkbd-makefile.patch} (100%)

diff --git a/package/xvkbd/xvkbd-2.8-makefile.patch b/package/xvkbd/xvkbd-makefile.patch
similarity index 100%
rename from package/xvkbd/xvkbd-2.8-makefile.patch
rename to package/xvkbd/xvkbd-makefile.patch
-- 
1.7.9.5
