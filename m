From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 22 May 2021 23:07:43 +0300
Subject: [Buildroot] [RFC/next 1/1] package/hostapd: enable MD4 in
 openssl
In-Reply-To: <20210522195910.GC3208066@scaer>
References: <20210522194845.593676-1-geomatsi@gmail.com>
 <20210522195910.GC3208066@scaer>
Message-ID: <YKlkjxJQTr3NjIxY@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

> > Hostapd assumes that openssl always provides MD4 support. However MD4
> > support in openssl has become optional since  commit a83d41867c8d
> > ("package/libopenssl: add option to enable some features").
> > 
> > Select openssl MD4 support in hostapd Kconfig to avoid build failures.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/09ce1d8009da98cd2a3f2c8488abaa9f060a9d6b/
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Applied to next, thanks.

Once again I forgot about wpa_supplicant. It has the same issue, though
not yet in autobuilder. I will double-check build and send another fix.

Regards,
Sergey
