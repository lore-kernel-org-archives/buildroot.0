From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 14 Dec 2009 15:55:17 -0200
Subject: [Buildroot] [git commit master] package/qt: bump version
In-Reply-To: <20091214163130.AD55F7777C@busybox.osuosl.org>
References: <20091214163130.AD55F7777C@busybox.osuosl.org>
Message-ID: <d6cda7730912140955n349a6603u8720fcffa12c55b5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Dec 14, 2009 at 2:29 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> I know 4.6.0 is out, but I don't have a setup to test it at the moment,
> so lets stick with 4.5.x for now.

Thanks. According to some posts at the avrfreaks.net forum, the 4.6.0
has some problems compiling with the avr32 toolchain. I haven't tried
myself yet. Looks like it's the compiler's fault. Atmel already has a
new gcc toolchain version 2.3.0 based on gcc 4.3.x as binary only
download for windows, but so far no sources at the website yet. I
think the one we are using is what they have labeled as 2.1.6

> There's apparently no .tar.bz2 of 4.5.3.
>

That's odd. ftp.trolltech.com/pub/qt also doesn't have a .bz2, the
same goes for 4.6.0 downloads :(
I guess they dropped the .bz2

Kind Regards,
    Thiago A. Correa
