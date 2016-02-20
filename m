From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 18:47:02 +0100
Subject: [Buildroot] [PATCH 3/8] package/links: add --with/--without-ssl
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
 <1455986411-14273-4-git-send-email-bernd.kuhls@t-online.de>
 <20160220174348.GN3418@free.fr>
Message-ID: <mdlmpcxlr5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 20 Feb 2016 18:43:48 +0100 schrieb Yann E. MORIN:

>>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>> +LINKS_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
>> --enable-ssl-pkgconfig
> 
> So, even when using pkg-config, we still need to tell it where OpenSSL
> is located?

Hi,

no, it works without the path to $STAGING_DIR, I just wanted to make 
sure ;)

Regards, Bernd
