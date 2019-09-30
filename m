From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:34:52 +0200
Subject: [Buildroot] [git commit] package/argus: drop empty line at end of
 .hash file
Message-ID: <20190930192936.8DD3383931@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54a191bfe915cdaedb02685ad11c208e79437b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 $: ./utils/check-package package/argus/*
 package/argus/argus.hash:7: empty line at end of file
 43 lines processed
 1 warnings generated

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/argus/argus.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/argus/argus.hash b/package/argus/argus.hash
index f6f727ccc9..b3196cce7d 100644
--- a/package/argus/argus.hash
+++ b/package/argus/argus.hash
@@ -4,4 +4,3 @@ md5	eaf5f5ec66569e556392802a70ef9ca5  argus-3.0.8.2.tar.gz
 # Locally computed
 sha256	ca4e3bd5b9d4a8ff7c01cc96d1bffd46dbd6321237ec94c52f8badd51032eeff  argus-3.0.8.2.tar.gz
 sha256	c68221f7207486bfce863fada4ba9b2aaf4adc9e1c672f965ae98e88143e5f16  README
-
