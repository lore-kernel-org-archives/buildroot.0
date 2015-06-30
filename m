From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 30 Jun 2015 17:33:12 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-06-29
In-Reply-To: <176867931.2355075.1435671554783.JavaMail.root@openwide.fr>
References: <176867931.2355075.1435671554783.JavaMail.root@openwide.fr>
Message-ID: <1435685592.3000.52.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Tue, 2015-06-30 at 15:39 +0200, Romain Naour wrote:
> Hi Thomas,
> 
> ----- Mail original -----
> > De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> > ?: buildroot at uclibc.org, "Gustavo Zacarias" <
> > gustavo.zacarias at free-electrons.com>, "Luca Ceresoli"
> > <luca@lucaceresoli.net>, "Romain Naour" <romain.naour@openwide.fr>, 
> > "Yann E. MORIN" <yann.morin.1998@free.fr>,
> > "Alexey Brodkin" <Alexey.Brodkin@synopsys.com>, "Bartosz 
> > Golaszewski" <bgolaszewski@baylibre.com>, "Vicente Olivert
> > Riera" <Vincent.Riera@imgtec.com>, "Francois Perrad" <
> > fperrad at gmail.com>, "J?rg Krause" <jkrause@posteo.de>
> > Envoy?: Mardi 30 Juin 2015 14:07:38
> > Objet: Re: [Buildroot] [autobuild.buildroot.net] Build results for 
> > 2015-06-29
> > 
> > 
> > >          arc |   host-gdb-arc-2015.06-rc1-gdb | NOK |
> > >          http://autobuild.buildroot.net/results/2b27a4a64c0b225ae
> > > 479ecfccf7a97f5ea95598c/
> > 
> > The infamous static/shared issue when building gdb. Romain, I 
> > thought
> > we had fixed this problem. Did we miss a patch?
> > 
> No, the problem was fixed but for arc-2014.11 wich was the only arc 
> version at
> that time.
> I think we need to add the PR56780 fix for arc-2015.06.
> http://git.buildroot.net/buildroot/commit/?id=0c12f72775b332fe7e3f758
> 9ec4d08534b8ec64e
> 
> Alexey can you do that ?

Sure let me send a patch for that.
Actually I just understood that when sending my patch for switching to
arc-2015.06-rc1 I completely forget to rename folders with patches in
binutils, gcc, gdb.

Please pardon my stupidity - I hope on next RCs and on release I'll be
more careful.

Patch is on its way.

-Alexey
