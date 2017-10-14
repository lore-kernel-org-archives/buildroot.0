From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 14 Oct 2017 21:54:20 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-10-13
In-Reply-To: <20171014063057.C392B207DB@mail.free-electrons.com>
References: <20171014063057.C392B207DB@mail.free-electrons.com>
Message-ID: <20171014185420.2cyymqxd26mq6cms@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Oct 14, 2017 at 08:30:57AM +0200, Thomas Petazzoni wrote:
>          arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ddaf58e9f8f8cfec9441ef64665e3a468b144d1f | ORPH
>       xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0a1e802dafd5cded6bf783127d0edbadc584583d | ORPH
>          arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/bbbe2b1725de6a837cf9d908b4bddfd0510dc077 | ORPH
>     mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/26e2654e3e75e5291d7d28db88aeeb482129d86b | ORPH
>          arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/b24bc247e4b4030b206c7381d897eab6f9f3aca7 | ORPH
>      powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/aa1736de612de010f4315d95eea1fa1502fe044c | ORPH
>     mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/e771adc5aed7b974eaca9fbb65a36a98816600d3 | ORPH
>          sh4 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/110e07d650049c1cd9006b40acc1cfd3fad832fc | ORPH
>         i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/296f161fefe2a785a16efc31651947ddd445df61 | ORPH
>         or1k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/45474b5bb456a9709cf300514909ef734f878de3 | ORPH
>       xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/bc7a17b57d124d07c739ac78a08a661ae56f58f7 | ORPH
>     mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ec0d00ca0217588ec4332de31cf49f537df1ea01 | ORPH
>         m68k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ea5d0d0e621e09f3bce6c2a178dfc88a51ada1b1 | ORPH

>>> dbus 1.10.24 Downloading
--2017-10-13 18:36:11--  https://dbus.freedesktop.org/releases/dbus/dbus-1.10.24.tar.gz
Resolving dbus.freedesktop.org (dbus.freedesktop.org)... 131.252.210.176, 2610:10:20:722:a800:ff:feda:470f
Connecting to dbus.freedesktop.org (dbus.freedesktop.org)|131.252.210.176|:443... connected.
ERROR: The certificate of `dbus.freedesktop.org' is not trusted.
--2017-10-13 18:36:12--  http://sources.buildroot.net/dbus-1.10.24.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2017-10-13 18:36:12 ERROR 404: Not Found.

What happened to sources.buildroot.net? dbus-1.10.24.tar.gz has been there at 
some point, isn't it?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
