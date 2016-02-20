From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2016 18:50:42 +0100
Subject: [Buildroot] [PATCH 3/8] package/links: add --with/--without-ssl
In-Reply-To: <mdlmpcxlr5.ln2@ID-313208.user.individual.net>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
 <1455986411-14273-4-git-send-email-bernd.kuhls@t-online.de>
 <20160220174348.GN3418@free.fr>
 <mdlmpcxlr5.ln2@ID-313208.user.individual.net>
Message-ID: <20160220175042.GP3418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-02-20 18:47 +0100, Bernd Kuhls spake thusly:
> Am Sat, 20 Feb 2016 18:43:48 +0100 schrieb Yann E. MORIN:
> 
> >>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >> +LINKS_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
> >> --enable-ssl-pkgconfig
> > 
> > So, even when using pkg-config, we still need to tell it where OpenSSL
> > is located?
> 
> no, it works without the path to $STAGING_DIR, I just wanted to make 
> sure ;)

Then do not provide it, please.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
