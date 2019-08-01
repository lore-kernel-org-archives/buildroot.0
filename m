From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:44:06 +0200
Subject: [Buildroot] [git commit] package/libsndfile: add license hash
Message-ID: <20190801084417.616DD80F7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfa76c6f6e1f0596b9bea479a3afb36a5280a30a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsndfile/libsndfile.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index 31500cd970..c744a7675a 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9	libsndfile-1.0.28.tar.gz
+# Locally calculated
+sha256	ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140	COPYING
