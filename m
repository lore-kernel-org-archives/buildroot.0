From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:09:37 +0200
Subject: [Buildroot] [RFC/next 1/1] package/hostapd: enable MD4 in
 openssl
In-Reply-To: <YKlkjxJQTr3NjIxY@curiosity>
References: <20210522194845.593676-1-geomatsi@gmail.com>
 <20210522195910.GC3208066@scaer> <YKlkjxJQTr3NjIxY@curiosity>
Message-ID: <20210522200937.GG3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-05-22 23:07 +0300, Sergey Matyukevich spake thusly:
> > > Hostapd assumes that openssl always provides MD4 support. However MD4
> > > support in openssl has become optional since  commit a83d41867c8d
> > > ("package/libopenssl: add option to enable some features").
> > > 
> > > Select openssl MD4 support in hostapd Kconfig to avoid build failures.
> > > 
> > > Fixes:
> > > http://autobuild.buildroot.net/results/09ce1d8009da98cd2a3f2c8488abaa9f060a9d6b/
> > > 
> > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > Applied to next, thanks.
> Once again I forgot about wpa_supplicant. It has the same issue, though
> not yet in autobuilder. I will double-check build and send another fix.

Ah, yes, damn, I forgot too. :-)

Thanks, I'll keep an eye for your patch, then. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
