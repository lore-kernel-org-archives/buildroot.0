From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:00:01 +0200
Subject: [Buildroot] [git commit branch/next] package/logsurfer: use hashes
	provided by upstream
Message-ID: <20170809221936.471B480ACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fa8937c98eb4e9b6dbba8ac08d645a962f31c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/logsurfer/logsurfer.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/logsurfer/logsurfer.hash b/package/logsurfer/logsurfer.hash
index 2c14078..539a41a 100644
--- a/package/logsurfer/logsurfer.hash
+++ b/package/logsurfer/logsurfer.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
+# From https://www.crypt.gen.nz/logsurfer/
+md5 4c26a74d813ccf766117c95c644aa601  logsurfer-1.8.tar.gz
+sha256 74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
