From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jun 2016 21:43:47 +0200
Subject: [Buildroot] [git commit] package/avrdude: add hash
Message-ID: <20160606195009.1BA77818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83844892f13985da93d2de4e87069727afff270e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/avrdude.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
new file mode 100644
index 0000000..b2c6125
--- /dev/null
+++ b/package/avrdude/avrdude.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b32128f4812d5e852cfba2e863d950ec30e0f72f09bc14fb41c02528bbc5dd18 avrdude-ad04c429a90f4c34f000ea4ae11db2705915a31f.tar.gz
