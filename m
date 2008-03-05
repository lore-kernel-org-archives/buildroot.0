From: Rex Ashbaugh <rexa@xeratech.com>
Date: Wed, 5 Mar 2008 10:23:51 -0700
Subject: [Buildroot] Glibc instead of uclibc
In-Reply-To: <c05908680803050916l5077f6f7xfc0e2d3100d60fa8@mail.gmail.com>
References: <c05908680803050744i38177299u2af49445fdff5990@mail.gmail.com>
	<20080305165910.GA1935@real.realitydiluted.com>
	<c05908680803050916l5077f6f7xfc0e2d3100d60fa8@mail.gmail.com>
Message-ID: <6311fe0b0803050923uf9686eep184516ce1bf14b8c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

yes and yes.
unless you can find a suitable pre-built cross glibc toolchain somewhere
online.

-Rex

On 3/5/08, Salvatore Fassi <salvatore.fassi@gmail.com> wrote:
>
> So is not possible to use the toolchain that is currently installed on my
> linux pc?
> Must I download binutils, gcc etc etc to compile a brand new toolchain
> (following the instructions provided in some cross-compiler how-to)?
>
>
> On Wed, Mar 5, 2008 at 5:59 PM, <sjhill@realitydiluted.com> wrote:
>
> > The only way to use glibc is to build an external glibc toolchain and
> > then specify using an external toolchain in buildroot.
> >
> > -Steve
> >
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080305/347dd65c/attachment-0001.htm 
