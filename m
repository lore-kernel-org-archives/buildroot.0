From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:44:13 +0100
Subject: [Buildroot] [git commit] qextserialport: remove useless () around
	configure command
Message-ID: <20161121214828.9C7A0800A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18af7b57870169581c5b38df94260dc1d40f7610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qextserialport/qextserialport.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 11b1cc8..f48f596 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -19,7 +19,7 @@ QEXTSERIALPORT_QMAKE = $(QT5_QMAKE)
 endif
 
 define QEXTSERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE))
+	cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE)
 endef
 
 define QEXTSERIALPORT_BUILD_CMDS
