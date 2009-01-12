From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 12 Jan 2009 11:59:06 +0100
Subject: [Buildroot] arch support
In-Reply-To: <87ljtgj44z.fsf@macbook.be.48ers.dk>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>
Message-ID: <496B227A.4060809@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> Hi,
> 
> I just finished building the defconfigs for all the archs (uclibc
> 0.9.30 / kernel headers 2.6.28 / binutils 2.19 / gcc 4.3.2 except for
> avr32 which does it's own thing)
> 
> I'm using those versions instead of the defaults, as I would like to
> change the defaults before the release.
> 
> Build logs are here: http://uclibc.org/~jacmet/br/
> 
> Status:
> 
> alpha: broken in libpthread
> arm: ok
> armeb: ok
> avr32: ok (uclibc-0.9.29-avr32, binutils-2.17-avr32, gcc-4.2.2-avr32)
> cris: broken in kernel headers

I have similar setup of toolchain packages and works for me here, except for linux headers which are 2.6.26. I'll try to compile it with 2.6.28, if IIRC there were some arch/cris folder movements in 2.6.28 that could be the culprit here.

Thanks,
HK

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si
