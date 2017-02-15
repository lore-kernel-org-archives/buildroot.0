From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 23:35:01 +0100
Subject: [Buildroot] [git commit] raptor: install package to staging
Message-ID: <20170301170421.804657FB5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4f54a98a38905fb4ca5413e174263913e20c9c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The raptor package installs some libraries, which will be useful for
upcoming packages parts of librdf.org, such as rasqal and redland.

Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/raptor/raptor.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index aea14e3..2653663 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -10,6 +10,7 @@ RAPTOR_SITE = http://download.librdf.org/source
 RAPTOR_DEPENDENCIES = libxml2 libxslt
 RAPTOR_LICENSE = GPLv2+ or LGPLv2.1+ or Apache-2.0+
 RAPTOR_LICENSE_FILES = LICENSE.txt
+RAPTOR_INSTALL_STAGING = YES
 
 # Flag is added to make sure the patch is applied for the configure.ac of raptor.
 RAPTOR_AUTORECONF = YES
