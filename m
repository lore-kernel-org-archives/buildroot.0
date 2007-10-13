From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 13 Oct 2007 22:33:19 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device	target/device/Atmel target etc...
In-Reply-To: <d6cda7730710130954u34f6158an4a924bef423239ac@mail.gmail.com>
References: <20071013101502.7A6EDA6151@busybox.net>
	<d6cda7730710130954u34f6158an4a924bef423239ac@mail.gmail.com>
Message-ID: <1192307599.26495.29.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-10-13 klockan 17:54 +0100 skrev Thiago A. Corr?a:
> Yay! Finally HEAD works for me :)
> 
> At least the toolchain build does :)
> 
> it has broken packages though.... just now I've got internal compiler
> errors while compiling qtopia which has templates.
> 
> I for one welcome our new 4.2.x compiler overlords, but shouldn't we
> keep 4.1.2 which is supposedly more stable, at least just as an
> option?
> 

It should be an option.
- Actually the default.
  The AVR32 gcc-4.2.1 will crash if Qtopia is built,

You cannot select 4.1.2?


> On 10/13/07, ulf at uclibc.org <ulf@uclibc.org> wrote:
> > Author: ulf
> > Date: 2007-10-13 03:15:01 -0700 (Sat, 13 Oct 2007)
> > New Revision: 20239
> >
> > Log:
> > Update AVR32 toolchain with new binutils and uClibc, This time it works (cross-fingers)
> >
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards
Ulf Samuelsson
