From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 16:14:09 +0100
Subject: [Buildroot] [git commit] package/python-pylibftdi: Fix LICENSE hash
 after 0.18.1 bump
Message-ID: <20191213150606.EC3EB8A47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b00dc39d07dcffc0cd00f4803901371d62b629b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit dd90d40b5226 (package/python-pylibftdi: bump version to 0.18.1)
bumped the version of the package but failed to take into account the change
of copyright year in the license file:

-Copyright (c) 2010-2018 Ben Bass
+Copyright (c) 2010-2019 Ben Bass

Adjust the license file to match the new content.

Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
[Peter: extend commit message, add SOB]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index ead3c9652a..62dac5cbbf 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -2,4 +2,4 @@
 md5	c48e442cef7b1e865b4d96ab92f509ad pylibftdi-0.18.1.tar.gz
 sha256	bdd04076933959b20b3c8b4fb8be7882d3362675f259e7eeb23ebff03b81859d  pylibftdi-0.18.1.tar.gz
 # Locally computed sha256 checksums
-sha256	581b6a16b3aaf23c4f7caee5defa099af833a95916e57ef24d7c12f893a0c160  LICENSE.txt
+sha256  0e40132339e1ef7d17d93837fbc273d1e87302e9295162bd19c9161e5700ddcc  LICENSE.txt
