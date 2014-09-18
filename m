From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:40:28 +0200
Subject: [Buildroot] [git commit] iptables: add hash
Message-ID: <20140918195020.F0C129B914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95c80cb62de20a5e4daa62af3b428530c0fa60de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/iptables.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
new file mode 100644
index 0000000..a813f74
--- /dev/null
+++ b/package/iptables/iptables.hash
@@ -0,0 +1,3 @@
+# From ftp://ftp.netfilter.org/pub/iptables/iptables-1.4.21.tar.bz2.{md5sum,sha1sum}
+md5	536d048c8e8eeebcd9757d0863ebb0c0 	iptables-1.4.21.tar.bz2
+sha1	85d4160537546a23a7e42bc26dd7ee62a0ede4c8	iptables-1.4.21.tar.bz2
