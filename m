From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 16:27:02 +0100
Subject: [Buildroot] [git commit] package/intel-mediadriver: drop empty line
 at end of hash file
Message-ID: <20200324151407.77E2388060@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14e110581bb2db7a1ca5e4cfe0e5b80bbacd121d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/483671586

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a3f124c3f8..5d016695ae 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,4 +1,3 @@
 # Locally computed
 sha256 a03bd75eefe9cb0245e3aab2723b3fef555d9f180a180b2c29d7b12d483d9ec2  intel-media-19.4.0r.tar.gz
 sha256 74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
-
