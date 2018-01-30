From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 13:14:33 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/avahi: fix typo
 in avahi_tmpfiles.conf
Message-ID: <20180130122144.DAC288746B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=173fa7c01082191b6ea17e3ab5df27c1d3851930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

There is an obvious typo in avahi_tmpfiles.conf: avahi-autoipd is
badly spelled.

Fixes bug #10641.

Reported-by: Michael Heinemann <posted@heine.so>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c427ce4d9f54d9b6433969ecb0fc8a4a5a9ba9b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi_tmpfiles.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi_tmpfiles.conf b/package/avahi/avahi_tmpfiles.conf
index f9aebdfd0d..da23c147fb 100644
--- a/package/avahi/avahi_tmpfiles.conf
+++ b/package/avahi/avahi_tmpfiles.conf
@@ -1 +1 @@
-d /tmp/avahi-autopid 0755 avahi avahi
+d /tmp/avahi-autoipd 0755 avahi avahi
