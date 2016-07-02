From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:05:50 +0200
Subject: [Buildroot] [git commit] package/systemd: Disable IMA support
Message-ID: <20160702110928.8E39381D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45adcb932630cbc1fdc3c3a182f1500073e6ab5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c15ef58..313e781 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -31,6 +31,7 @@ SYSTEMD_CONF_OPTS += \
 	--disable-manpages \
 	--disable-selinux \
 	--disable-pam \
+	--disable-ima \
 	--disable-libcryptsetup \
 	--disable-efi \
 	--disable-gnuefi \
