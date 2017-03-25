From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:11:42 +0100
Subject: [Buildroot] [git commit] ustream-ssl: bump version
Message-ID: <20170325141449.A19EC82189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c57793e895640f17fb66981131c023c8145625ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ustream-ssl/ustream-ssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
index b83d129..9b10788 100644
--- a/package/ustream-ssl/ustream-ssl.mk
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAM_SSL_VERSION = ec80adaa1b47f28d426fa19c692011ce60b992d6
+USTREAM_SSL_VERSION = 45ac93088bc6f2d8ef3b0512d8e1ddfd9c4ee9e5
 USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
 USTREAM_SSL_LICENSE = ISC
 USTREAM_SSL_LICENSE_FILES = ustream-ssl.h
