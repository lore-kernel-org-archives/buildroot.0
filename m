From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Dec 2014 12:34:23 +0100
Subject: [Buildroot] [git commit] libsoxr: add a hash file
Message-ID: <20141209133124.309F080096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43692d3bb7f4d6cda337043af47a67295b09f6e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It will clarify errors like this:
  http://autobuild.buildroot.net/results/923/923d4ba849839beca89f427687bbd903d6037b15/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoxr/libsoxr.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libsoxr/libsoxr.hash b/package/libsoxr/libsoxr.hash
new file mode 100644
index 0000000..f49cc81
--- /dev/null
+++ b/package/libsoxr/libsoxr.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  dcc16868d1a157079316f84233afcc2b52dd0bd541dd8439dc25bceb306faac2  soxr-0.1.1-Source.tar.xz
