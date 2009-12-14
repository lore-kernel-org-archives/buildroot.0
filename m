From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Dec 2009 20:42:02 +0100
Subject: [Buildroot] [git commit master] package/qt: bump version
In-Reply-To: <d6cda7730912140955n349a6603u8720fcffa12c55b5@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Mon, 14 Dec 2009
	15:55:17 -0200")
References: <20091214163130.AD55F7777C@busybox.osuosl.org>
	<d6cda7730912140955n349a6603u8720fcffa12c55b5@mail.gmail.com>
Message-ID: <87skbdqr5h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> I know 4.6.0 is out, but I don't have a setup to test it at the
 >> moment, so lets stick with 4.5.x for now.

 Thiago> Thanks. According to some posts at the avrfreaks.net forum, the 4.6.0
 Thiago> has some problems compiling with the avr32 toolchain. I haven't tried
 Thiago> myself yet. Looks like it's the compiler's fault. Atmel already has a
 Thiago> new gcc toolchain version 2.3.0 based on gcc 4.3.x as binary only
 Thiago> download for windows, but so far no sources at the website yet. I
 Thiago> think the one we are using is what they have labeled as 2.1.6

Ok - Thanks for the heads up.

 >> There's apparently no .tar.bz2 of 4.5.3.
 >> 

 Thiago> That's odd. ftp.trolltech.com/pub/qt also doesn't have a .bz2, the
 Thiago> same goes for 4.6.0 downloads :(
 Thiago> I guess they dropped the .bz2

Yeah, kind of a pain with that huge qt tarball, .gz is ~10 MB bigger
than .bz2:

-rw-r--r-- 1 peko peko 114M 2009-06-25 11:05 qt-embedded-linux-opensource-src-4.5.2.tar.bz2
-rw-r--r-- 1 peko peko 124M 2009-10-01 13:55 qt-embedded-linux-opensource-src-4.5.3.tar.gz

-- 
Bye, Peter Korsgaard
