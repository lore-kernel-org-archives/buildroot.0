From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 17:41:14 +0100
Subject: [Buildroot] [git commit] package/dovecot: add hash
Message-ID: <20150327164118.5B304818E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49fedc613e7acd0fa1ce3d675db029717332e7d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/dovecot.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
new file mode 100644
index 0000000..7f2f9b1
--- /dev/null
+++ b/package/dovecot/dovecot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256sum	56ce1287a17fa88a2083116db00200deff1a5390af5eac1c8ae3f59a2079cff0	dovecot-2.2.16.tar.gz
