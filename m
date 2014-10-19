From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 19:24:58 +0200
Subject: [Buildroot] [git commit] openvpn: add hash file
Message-ID: <20141019172550.853EDAFD61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4936d76b41e1f7d2b06aad9a58c3ba603a725a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/openvpn.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
new file mode 100644
index 0000000..d13258d
--- /dev/null
+++ b/package/openvpn/openvpn.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1ccd72c99e5c5627a7f7eb826489027dad35ce260b925b49dfc1f90bd24719ee	openvpn-2.3.4.tar.xz
