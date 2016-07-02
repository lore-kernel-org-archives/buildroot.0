From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:05:34 +0200
Subject: [Buildroot] [git commit] package/systemd: Disable the test coverage
Message-ID: <20160702110928.7AAE081D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ad1ce83876fc67b96f017f11e6c243ab7522b89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e3aacc6..c15ef58 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -36,6 +36,7 @@ SYSTEMD_CONF_OPTS += \
 	--disable-gnuefi \
 	--disable-ldconfig \
 	--disable-tests \
+	--disable-coverage \
 	--with-default-dnssec=no \
 	--without-python
 
