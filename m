From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jun 2020 23:13:02 +0200
Subject: [Buildroot] [PATCH v2 01/14] package/systemd: configure nss
 plugins in nsswitch.conf
In-Reply-To: <CADYdroN2yUOhkbNLTGLvsPEjhAh0Nv0LAyPLictTFL9mhhYjWQ@mail.gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-2-nolange79@gmail.com>
 <20200615114825.GZ2346@scaer>
 <CADYdroN2yUOhkbNLTGLvsPEjhAh0Nv0LAyPLictTFL9mhhYjWQ@mail.gmail.com>
Message-ID: <20200617211302.GJ2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-06-15 14:28 +0200, Norbert Lange spake thusly:
> Am Mo., 15. Juni 2020 um 13:48 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> >  2. we already have other packages that may tweak that file, like:
> >     package/nss-mdns/nss-mdns.mk
> >     package/nss-myhostname/nss-myhostname.mk
> The package nss-myhostname should be marked as conflicting with
> BR2_PACKAGE_SYSTEMD_MYHOSTNAME.
> (the plugin got assimilated by systemd)

That's already the case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
