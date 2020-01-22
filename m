From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 22 Jan 2020 23:23:11 +0100
Subject: [Buildroot] [git commit] package/audiofile: add hash for license
 file
Message-ID: <20200122222120.6184F83649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcf6b37da7e435a0c40e09d124a0928da9ce2a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[Arnout: also replace tab with spaces]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/audiofile/audiofile.hash | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/audiofile/audiofile.hash b/package/audiofile/audiofile.hash
index 3b9cba64f1..f4028f9a6e 100644
--- a/package/audiofile/audiofile.hash
+++ b/package/audiofile/audiofile.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	cdc60df19ab08bfe55344395739bb08f50fc15c92da3962fac334d3bff116965  audiofile-0.3.6.tar.gz
+sha256  cdc60df19ab08bfe55344395739bb08f50fc15c92da3962fac334d3bff116965  audiofile-0.3.6.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
