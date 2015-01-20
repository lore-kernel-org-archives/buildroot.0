From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jan 2015 17:01:16 +0100
Subject: [Buildroot] [git commit] qextserialport: add license file
Message-ID: <20150120160220.4AEB6801A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58c5022029e58a59f7504a781240c80b4f03a3a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qextserialport/qextserialport.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 2949da9..61f7b05 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -9,6 +9,7 @@ QEXTSERIALPORT_SITE = https://qextserialport.googlecode.com/git
 QEXTSERIALPORT_SITE_METHOD = git
 
 QEXTSERIALPORT_LICENSE = MIT
+QEXTSERIALPORT_LICENSE_FILES = LICENSE
 
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
