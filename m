From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Oct 2014 17:27:46 +0200
Subject: [Buildroot] [git commit] hostapd: add hash
Message-ID: <20141015125351.D6A3BB2DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee1b691e0a0eccdc8c950ce0a6568d6ab76d81f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
new file mode 100644
index 0000000..5aefa14
--- /dev/null
+++ b/package/hostapd/hostapd.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c94c2b76876fad4c80a1063a06f958a2189ba5003475016fa7658a1ca49bb4df	hostapd-2.3.tar.gz
