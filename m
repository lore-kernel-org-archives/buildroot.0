From: benoit.mauduit at gmail.com <benoit.mauduit@gmail.com>
Date: Wed,  8 Jun 2011 15:57:28 +0200
Subject: [Buildroot] [PATCH 3/3] oprofile: Bump to 0.9.6
In-Reply-To: <1307541448-15176-1-git-send-email-benoit.mauduit@gmail.com>
References: <1307541448-15176-1-git-send-email-benoit.mauduit@gmail.com>
Message-ID: <1307541448-15176-3-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benoit Mauduit <benoit.mauduit@openwide.fr>

---
 package/oprofile/oprofile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 42bf0e2..4522cda 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -3,7 +3,7 @@
 # oprofile
 #
 #############################################################
-OPROFILE_VERSION := 0.9.4
+OPROFILE_VERSION := 0.9.6
 OPROFILE_CONF_OPT :=	--localstatedir=/var \
 			--with-kernel-support
 
-- 
1.7.5.2
