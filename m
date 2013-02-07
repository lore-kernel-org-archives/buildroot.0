From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Feb 2013 21:36:38 +0100
Subject: [Buildroot] [PATCH 4/5] fbset: define license
In-Reply-To: <1360167853-7177-4-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 6 Feb 2013 17:24:12 +0100")
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
 <1360167853-7177-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <87mwvflv3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Luca> ---
 Luca>  package/fbset/fbset.mk |    1 +
 Luca>  1 file changed, 1 insertion(+)

 Luca> diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
 Luca> index 3423259..85d97d5 100644
 Luca> --- a/package/fbset/fbset.mk
 Luca> +++ b/package/fbset/fbset.mk
 Luca> @@ -7,6 +7,7 @@
 Luca>  FBSET_VERSION = 2.1
 Luca>  FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 Luca>  FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 Luca> +FBSET_LICENSE = GPL

It's not explicitly said, but considering how much it is linked to the
kernel fbdev interface and the references to COPYING in the Linux kernel
I think it should be GPLv2.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
