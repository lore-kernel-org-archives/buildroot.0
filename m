From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:07:21 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add Nicholas Sielicki as
 contact for galileo_defconfig
Message-ID: <20191231150327.B99128E94F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ea6b70fbe9287699f244e3581c300e2bea077b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nicholas was the most recent person to make significant changes to the
galileo_defconfig, so let's add him as a contact for this defconfig,
so that he receives notification of build failures and gets Cc'ed on
patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nicholas Sielicki <sielicki@yandex.com>
Cc: Ray Kinsella <ray.kinsella@intel.com>
Cc: Padraig James Connolly <padraig.connolly@intel.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a41b426a9..f867662d58 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1787,6 +1787,10 @@ F:	package/libevdev/
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
 
+N:	Nicholas Sielicki <sielicki@yandex.com>
+F:	board/intel/galileo/
+F:	configs/galileo_defconfig
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
