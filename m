From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Dec 2016 08:54:51 +0100
Subject: [Buildroot] [git commit] ti-cgt-pru: fix typo in comment
Message-ID: <20161205075509.11FC181946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55fba24d346a0f937d84e8461a71730281be879c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-cgt-pru/ti-cgt-pru.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index 7c89444..d94f091 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -21,7 +21,7 @@ define HOST_TI_CGT_PRU_EXTRACT_CMDS
 endef
 
 # Since this is largely prebuilt toolchain and likes to live in its
-# own directory, put is in $(HOST_DIR)/usr/share/ti-cgt-pru/.
+# own directory, put it in $(HOST_DIR)/usr/share/ti-cgt-pru/.
 # Packages wanting to use this toolchain need to use this path as TI's
 # standard PRU_CGT path e.g. make PRU_CGT=$(TI_CGT_PRU_INSTALLDIR)...
 TI_CGT_PRU_INSTALLDIR = $(HOST_DIR)/usr/share/ti-cgt-pru
