From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 25 Mar 2008 10:54:57 -0300
Subject: [Buildroot] avr32 breakage
In-Reply-To: <46a136670803250433i2e969315u587a5a48809947c5@mail.gmail.com>
References: <46a136670803211342if9a5d93m6b4f821a165dac26@mail.gmail.com>
	<049901c88e5d$528dda30$070514ac@atmel.com>
	<46a136670803250433i2e969315u587a5a48809947c5@mail.gmail.com>
Message-ID: <d6cda7730803250654n725ec5e9m41586313089e42df@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Btw, 4.1.2 external sources fails to build.

On Tue, Mar 25, 2008 at 8:33 AM, John Voltz <john.voltz@gmail.com> wrote:
> I used the internal source, without the AVR32 patches. I'm not sure what to
> do with the AVR32 stuff yet. gcc 4.2.1 creates unstable executables. I'm
> recommending that people use gcc 4.1.2 until something is done about 4.2.1.
> I'm generating and testing updated patches for 4.1.2 right now. I'll commit
> them if they don't cause problems with other arches and seem to be stable.
>
> John
>
>
>
> On Tue, Mar 25, 2008 at 4:45 AM, Ulf Samuelsson <ulf.samuelsson@atmel.com>
> wrote:
> >
> >
> >
> >
> >
> > >I can say without a doubt now that the avr32 gcc patches are bad. I
> created
> > > a bootable ext3 image for x86 and ran it in qemu, everything works fine.
> > > Blackbox works fine in X too. I wasn't able to get Webkit+Midori to run
> > > because I didn't have time before I left the shop. I will report back
> with
> > > more later.
> > >
> > > John
> > >
> >
> > Did you build using the external source, or internal source.
> >
> > Best Regards
> > Ulf Samuelsson
> >
> >
>
>
> _______________________________________________
>  buildroot mailing list
>  buildroot at uclibc.org
>  http://busybox.net/mailman/listinfo/buildroot
>
