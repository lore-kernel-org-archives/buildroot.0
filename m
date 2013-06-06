From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  6 Jun 2013 11:47:21 -0500
Subject: [Buildroot] [PATCH 06/14] ne10: fix github tarball to use commit id
In-Reply-To: <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
References: <bug-6302-163@https.bugs.busybox.net/>
 <1370537249-15682-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370537249-15682-6-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/ne10/ne10.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 64cd1a9..27cf1bc 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -7,7 +7,7 @@
 # We use a Git commit ID because the last tagged version is more than
 # one year old.
 NE10_VERSION = 88c18f0
-NE10_SITE = http://github.com/projectNe10/Ne10/tarball/master
+NE10_SITE = http://github.com/projectNe10/Ne10/tarball/$(NE10_VERSION)
 NE10_LICENSE = BSD-3c or Apache 2.0
 NE10_LICENSE_FILES = doc/LICENSE
 
-- 
1.7.9.5
