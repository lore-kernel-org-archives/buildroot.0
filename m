From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 09:09:15 +0200
Subject: [Buildroot] [git commit] ne10: Use http instead of git method for
	package fetching.
Message-ID: <20130415070952.351A59B560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c24e66a3ee4d8933d21fe0e6207a6a9aec12ba81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rework package fetching according official documentation:
http://buildroot.uclibc.org/downloads/manual/manual.html#github-download-url

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ne10/ne10.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index 184f0f8..64cd1a9 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -6,8 +6,8 @@
 
 # We use a Git commit ID because the last tagged version is more than
 # one year old.
-NE10_VERSION = 88c18f02199947b2c8b57796f5a3ca53160aff96
-NE10_SITE = git://github.com/projectNe10/Ne10.git
+NE10_VERSION = 88c18f0
+NE10_SITE = http://github.com/projectNe10/Ne10/tarball/master
 NE10_LICENSE = BSD-3c or Apache 2.0
 NE10_LICENSE_FILES = doc/LICENSE
 
