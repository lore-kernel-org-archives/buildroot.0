From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Oct 2014 00:44:13 +0200
Subject: [Buildroot] [git commit] crda: add hash file
Message-ID: <20141016060905.7F1D1B2F8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0743da8ec6b1a1d5b8aad1abdd356bb2839a3c95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/crda/crda.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/crda/crda.hash b/package/crda/crda.hash
new file mode 100644
index 0000000..2fc04e6
--- /dev/null
+++ b/package/crda/crda.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/crda/sha256sums.asc
+sha256	2f85da7ab0170b140d6ed62596c8f268d4a7dedecf84cac7182ada979742ff59	crda-3.13.tar.xz
