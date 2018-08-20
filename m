From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:39:18 +0200
Subject: [Buildroot] [git commit branch/next] package/libsrtp: fix license
 hash
Message-ID: <20180820203217.DFCC18E00C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22b89ffe42ddba393ad5b36195c3bbb8cffcb1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

While bumping the package from 1.5.4 to 2.2.0 the license hash from
version 1.6.0 was erroneously used.

Fixes
http://autobuild.buildroot.net/results/2d8/2d8344bab5b87d20156814b96cbbab1d5fc89586/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsrtp/libsrtp.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 0aa8a67497..1a88673c81 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256 44fd7497bce78767e96b54a11bca520adb2ad32effd515f04bce602b60a1a50b  libsrtp-v2.2.0.tar.gz
-sha256 8defed37d52096ae14b60adc499c33d43975109bc265552ee67e9a888c634b93  LICENSE
+sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
