From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 13 Feb 2012 09:48:59 +0100
Subject: [Buildroot] Buildroot 2012.02-rc1 released
In-Reply-To: <87hayvznot.fsf@macbook.be.48ers.dk>
References: <87hayvznot.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LVdzKaog1OOEOM-uAg90UQz5VvjnsvtLQ_9trHamrkH_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 12, 2012 at 11:33 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Hi,
>
> Buildroot 2012.02-rc1 is released - Go download it at:
>
> http://buildroot.net/downloads/buildroot-2012.02-rc1.tar.gz
>
> or
>
> http://buildroot.net/downloads/buildroot-2012.02-rc1.tar.bz2
>
> Or get it from Git:
>
> git://git.buildroot.net/buildroot
>
> Like usual for the February releases, we're a bit late because of
> FOSDEM, where we had a developer day. Expect a report from the day
> soon.
>
> Please give it a spin and report any problems to the mailing list or
> bug tracker. Many thanks to the people contributing to this release:
>
> git shortlog -s -n 2011.11..
>
> ? 170 ?Peter Korsgaard
> ? ?86 ?Gustavo Zacarias
> ? ?39 ?Yegor Yefremov
> ? ?38 ?Arnout Vandecappelle (Essensium/Mind)
> ? ?33 ?Thomas Petazzoni
> ? ?18 ?Will Newton
> ? ?12 ?Daniel Mack
> ? ?10 ?Thomas De Schampheleire
> ? ? 9 ?Sven Neumann
> ? ? 7 ?Maxime Ripard
> ? ? 5 ?Alexandre Belloni
> ? ? 4 ?Luca Ceresoli
> ? ? 4 ?Sagaert Johan
> ? ? 2 ?Felipe Contreras
> ? ? 2 ?Frank Hunleth
> ? ? 2 ?Frederik Pasch
> ? ? 2 ?H Hartley Sweeten
> ? ? 2 ?Jean-Christophe PLAGNIOL-VILLARD
> ? ? 2 ?Julien Boibessot
> ? ? 1 ?ANDY KENNEDY
> ? ? 1 ?Bernhard Reutner-Fischer
> ? ? 1 ?Daniele Salvatore Albano
> ? ? 1 ?Henri Bragge
> ? ? 1 ?Lukasz Pulka
> ? ? 1 ?Samuel MARTIN
> ? ? 1 ?Sergio Prado
> ? ? 1 ?Shawn J. Goff
> ? ? 1 ?Trevor Woerner
> ? ? 1 ?Tristan Lelong
> ? ? 1 ?V?ctor Manuel J?quez Leal
> ? ? 1 ?Yann E. MORIN
>
> It's nice to see contributions from lots of new people in addition to
> the "oldtimers". This time I'm again ahead of Gustavo with almost 2x
> commits ;)
>
> It has been a quite busy development cycle, with more than 450
> commits, and a number of large scale changes.
>
> Of noteworthy new features we have:
>
> ?- Large number of new packages (50): Connman & NetworkManager, EFL,
> ? Jquery related javascript libraries, kmod, lttng and a number of
> ? python packages.
>
> ?- Default to GCC 4.5.x / Binutils 2.22 / uClibc 0.9.33 for the
> ? internal toolchain.
>
> ?- Support for SCP and mercurial package sources. Host dependencies
> ? are now derived from target ones by default.
>
> ?- Packages can now define device table snippets for special
> ? permissions / device nodes when static /dev is used.
>
> ?- Updated documentation. The generated Asciidoc documenation is now
> ? included in tarballs in text/html/pdf format.
>
> ?- Additional QEMU defconfigs, at91 defconfigs updated and lpc3250
> ? configs added.
>
> ?- Host utilities menu with commonly used host tools.
>
> And the usual package version updates and bug fixes. See the CHANGES
> file for details:
>
> http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc1
>
> Just like last cycle, I will now create a next branch and start
> merging in new feature, rather than wait until 2012.02 is released.
>
> Enjoy!

One thing I haven't seen was the deprecation of the customize package.
Maybe we can still do this in 2012.02? I'd submit a patch but since
you also need to change the CHANGES file I think it makes more sense
if you do it yourself, no?

Best regards,
Thomas
