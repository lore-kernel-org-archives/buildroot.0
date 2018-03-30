From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:45:50 +0200
Subject: [Buildroot] [git commit] opusfile: add hash for license file
Message-ID: <20180330194951.68C4F83EF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4308f0c85062ae398b1ecad181560552f8d79673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opusfile/opusfile.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opusfile/opusfile.hash b/package/opusfile/opusfile.hash
index 528ded2079..59e08192f5 100644
--- a/package/opusfile/opusfile.hash
+++ b/package/opusfile/opusfile.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
 sha256 f75fb500e40b122775ac1a71ad80c4477698842a8fe9da4a1b4a1a9f16e4e979  opusfile-0.9.tar.gz
+
+# Hash for license file
+sha256 0267ae795ab744c4e0f9c45e249440fdf2e75dac8c804f36066b28649bf74aaf  COPYING
