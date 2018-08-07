From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 07 Aug 2018 16:48:48 +0300
Subject: [Buildroot] [PATCH] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
In-Reply-To: <1533648866-61581-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1533648866-61581-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87r2jab83j.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Matt Weber writes:
> +ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SFTP),y)
> +PROFTPD_CONF_OPTS += --enable-openssl

Don't you need openssl/libressl as build time dependency?

> +PROFTPD_MODULES += mod_sftp
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
