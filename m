From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 22:44:32 +0200
Subject: [Buildroot] [PATCH 5/7] package/libsndfile: add license hash
In-Reply-To: <20190728204434.12356-1-bernd.kuhls@t-online.de>
References: <20190728204434.12356-1-bernd.kuhls@t-online.de>
Message-ID: <20190728204434.12356-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.20.1
