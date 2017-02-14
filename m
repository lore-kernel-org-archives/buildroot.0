From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 14 Feb 2017 13:22:14 -0200 (BRST)
Subject: [Buildroot] unrecognized command line option
In-Reply-To: <CAHxBh_SM289CB32RrR8zOitn-LX0iVJLKcf0HpN1sV5JamV3+w@mail.gmail.com>
References: <CAHxBh_SM289CB32RrR8zOitn-LX0iVJLKcf0HpN1sV5JamV3+w@mail.gmail.com>
Message-ID: <1842521354.10376219.1487085734283.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Ron Eggler" <ron.eggler@gmail.com>
> To: buildroot at busybox.net
> Sent: Tuesday, February 14, 2017 1:08:08 PM
> Subject: [Buildroot] unrecognized command line option

> Hi,

> I'm trying to compile using buildroot with my own x toolchain (created for ppc
> with crosstool-ng) but I get the following error on make:

> powerpc-e500v2-linux-gnuspe-gcc: error: unrecognized command line option '
> -march=i586 '

You must choose the suitable target options (first item in the main menu
when you run "make menuconfig") to match your target platform.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
