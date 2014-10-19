From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 19:25:08 +0200
Subject: [Buildroot] [git commit] pppd: add hash file
Message-ID: <20141019172550.8CA2CAFD63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e106030afb293786ef265df6f87e1405b1d3ca5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pppd/pppd.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
new file mode 100644
index 0000000..2bc248d
--- /dev/null
+++ b/package/pppd/pppd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30	ppp-2.4.7.tar.gz
