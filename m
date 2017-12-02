From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:04:55 +0100
Subject: [Buildroot] [git commit] freetype: remove empty line at end of hash
 file
Message-ID: <20171202131022.7DE387FF89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e030ae9b294d46ae0aaa4ff6e550a756a028ed05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

./package/freetype/freetype.hash:10: empty line at end of file

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 3997e81..51d0184 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -7,4 +7,3 @@ sha256	e5435f02e02d2b87bb8e4efdcaa14b1f78c9cf3ab1ed80f94b6382fb6acc7d78	freetype
 sha256	fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb	docs/LICENSE.TXT
 sha256	4a9a548027a2c1d37788519dea833294c9c81f1ebc280e817f41f50d0c642d78	docs/FTL.TXT
 sha256	c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18	docs/GPLv2.TXT
-
