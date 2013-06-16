From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 22:16:39 +0200
Subject: [Buildroot] [PATCH 07/12] luacrypto: New package
In-Reply-To: <CAB0FRsuYNEGZdVwj3mKVBRp2uyfwY5EbOfZ=wuSMvO51iDZMFg@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Mon, 20 May 2013
 18:07:51 +0200")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-7-git-send-email-shmuelzon@gmail.com>
 <CAB0FRsuYNEGZdVwj3mKVBRp2uyfwY5EbOfZ=wuSMvO51iDZMFg@mail.gmail.com>
Message-ID: <87wqptu7yw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

Hi,

 Fran?ois>     +++ b/package/luacrypto/luacrypto.mk
 Fran?ois>     @@ -0,0 +1,15 @@
 Fran?ois>     +#############################################################
 Fran?ois>     +#
 Fran?ois>     +# lucrypto


 Fran?ois> typo : luacrypto
 Fran?ois> ?

 Fran?ois>     +#
 Fran?ois>     +#############################################################
 Fran?ois>     +
 Fran?ois>     +LUACRYPTO_VERSION = master
 Fran?ois>     +LUACRYPTO_SITE = git://github.com/mkottman/luacrypto.git
 Fran?ois>     +LUACRYPTO_SITE_METHOD = git


 Fran?ois> master is not fixed reference.

 Fran?ois> -LUACRYPTO_VERSION = master
 Fran?ois> -LUACRYPTO_SITE = git://github.com/mkottman/luacrypto.git
 Fran?ois> -LUACRYPTO_SITE_METHOD = git
 Fran?ois> +LUACRYPTO_VERSION = 0.3.2
 Fran?ois> +LUACRYPTO_SOURCE = $(LUACRYPTO_VERSION).tar.gz
 Fran?ois> +LUACRYPTO_SITE = https://github.com/mkottman/luacrypto/archive


 Fran?ois> ?

 Fran?ois>     +LUACRYPTO_LICENSE = MIT
 Fran?ois>     +LUACRYPTO_LICENSE_FILES = COPYING
 Fran?ois>     +LUACRYPTO_DEPENDENCIES = lua luasocket openssl


 Fran?ois> luasocket is not a built dependency.

Assaf, will you send an updated patch taking the review feedback into
consideration?

-- 
Bye, Peter Korsgaard
