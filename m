From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2011 12:25:29 +0200
Subject: [Buildroot] [PATCH 07/28] barebox: re-indent variable
	definitions
In-Reply-To: <87mxgm1pjw.fsf@macbook.be.48ers.dk>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <a7757c6616c0eb9d9f1a3dddf06a3be2f24adcb0.1309895466.git.thomas.petazzoni@free-electrons.com>
 <87mxgm1pjw.fsf@macbook.be.48ers.dk>
Message-ID: <20110710122529.59118e17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 10 Jul 2011 10:57:07 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I prefer the BAREBOX_CAT = $(BZCAT) style, which is the most commonly
> used style under package:

This assignation is removed by patch 8/28, which convers Barebox to
GENTARGETS :

--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -7,8 +7,11 @@
 BAREBOX_VERSION := 2011.05.0
 BAREBOX_SOURCE  := barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE    := http://www.barebox.org/download/
-BAREBOX_DIR     := $(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-BAREBOX_CAT     := $(BZCAT)

Knowing this, is it a problem if patch 7/28 uses := ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
