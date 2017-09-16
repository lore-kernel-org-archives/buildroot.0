From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Sep 2017 18:46:21 +0200
Subject: [Buildroot] [PATCH 17/49 v2] package/asterisk: add optional
 openldap dependency
In-Reply-To: <aogq8exe21.ln2@ID-313208.user.individual.net>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <81e461eac586fd2aab201f5b3d2c0600ee0304e7.1504993178.git.yann.morin.1998@free.fr>
 <aogq8exe21.ln2@ID-313208.user.individual.net>
Message-ID: <20170916164621.GA3611@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-09-14 16:36 +0200, Bernd Kuhls spake thusly:
> Hi Yann,
> 
> Am Sat, 09 Sep 2017 23:39:23 +0200 schrieb Yann E. MORIN:
> 
> > +ifeq ($(BR2_PACKAGE_OPENLDAP),y)
> > +ASTERISK_DEPENDENCIES += openldap
> > +ASTERISK_CONF_OPTS += --without-ldap
> 
> this should be "--with-ldap"

Uhu... Good catch. ;-)

Regards,
Yann E. MORIN.

> > +else
> > +ASTERISK_CONF_OPTS += --without-ldap
> > +endif
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
