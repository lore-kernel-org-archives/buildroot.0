From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Sep 2017 16:36:26 +0200
Subject: [Buildroot] [PATCH 17/49 v2] package/asterisk: add
 optional	openldap dependency
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <81e461eac586fd2aab201f5b3d2c0600ee0304e7.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <aogq8exe21.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Sat, 09 Sep 2017 23:39:23 +0200 schrieb Yann E. MORIN:

> +ifeq ($(BR2_PACKAGE_OPENLDAP),y)
> +ASTERISK_DEPENDENCIES += openldap
> +ASTERISK_CONF_OPTS += --without-ldap

this should be "--with-ldap"

> +else
> +ASTERISK_CONF_OPTS += --without-ldap
> +endif

Regards, Bernd
