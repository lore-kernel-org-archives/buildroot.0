From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 15 Jan 2019 10:25:44 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-01-13
In-Reply-To: <CANQCQpYdJXCwVSF5PmtFp7FwrWxTFpU0C4Lr5+D51oCnHDjOdw@mail.gmail.com>
References: <20190114070059.9F75420A85@mail.bootlin.com>
 <CANQCQpYdJXCwVSF5PmtFp7FwrWxTFpU0C4Lr5+D51oCnHDjOdw@mail.gmail.com>
Message-ID: <CANQCQpb=eyyzjnJ6T+EnseYL=ifkj+s6QbSUN_K2bore-f+d-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jan 14, 2019 at 10:22 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas,
>
> On Mon, Jan 14, 2019 at 1:01 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Build statistics for 2019-01-13
> > ===============================
> >
> >       branch |  OK | NOK | TIM | TOT |
> >    2018.02.x |  23 |   0 |   0 |  23 |
> >    2018.11.x |  26 |   2 |   0 |  28 |
> >       master | 241 |  50 |   0 | 291 |
> >
> > Results for branch '2018.11.x'
> > ==============================
> >
> > Classification of failures by reason
> > ------------------------------------
> >
> >                 openmpi-1.10.7 | 1
> >                qt5webkit-5.9.1 | 1
> >
> >
> > Detail of failures
> > ------------------
> >
> > microblazeel |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/1b855387bfb68233b821f588ec4376bfd24ba634 | ORPH
> >       mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b26a1a9c603a46d05e16aaf04c97d7edb1b5ec86 |
> >
> > Results for branch 'master'
> > ===========================
> >
>
> >      powerpc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/97ca21878d36c0d56dc94c5e126b87529cc63f0f |
> >     mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f4c9902e50668d3e1009d22f4e47784965d951db |
> >       mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/ebeb6be1be1a5f46d30df62b0e17e52492722a68 |
> >          arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c7851b6d72c914b3f805650355973b2dae5c96fc |
> >         m68k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a0352ac5e02da778670da6053d49b7948765295a |
> >         i686 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e0fbd62faf7df2edaf83672c7d998a9b263a9f00 |
> >       mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/0ccaa03babc54b3595b4da71447813c6ec8f60a3 |
> >       x86_64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/5c56d33733c98fae536998fcc669c069457ad0ce |
> >          arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/dc94056643c6efc4e1b29371bcac0d387e511d15 |
> >       mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/09ce2709d645a59a67c5f28cc53ef60ce8515193 |
> >      riscv32 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/9e295ed2447a3561f55dbcfb662583ecbb5d10be |
> >      aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c649494027484fb71b4916ddb049bbefe45db2ce |
> >     mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e60ad0625c7f05d109e4eabaee594e6741e5c5aa |
> >     mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a88f37e03982ef3f189fb3758c23237d60966907 |
>
> The bump to 2.58.0 built Ok
> 2019-01-15T04:07:32 >>> glib-networking 2.58.0 Fixing libtool files
> 2019-01-15T04:07:32 >>> glib-networking 2.58.0 Installing to target
> Done in 20min 55s
>
> Original build of 2.56.1 failed as expected.
> 2019-01-15T04:20:29 Compiler for C supports arguments
> -Wl,--version-script,/accts/mlweber1/rclinux/br-reproduce/96b287a6de9f8bae48d75ff6652f3c909e0181b0glibnetworking/buildroot/output/build/glib-networking-2.56.1/glib-networking.map:
> YES
> 2019-01-15T04:20:30 Cross dependency glib-2.0 found: YES 2.56.3
> 2019-01-15T04:20:30 Cross dependency gio-2.0 found: YES 2.56.3
> 2019-01-15T04:20:30 Cross dependency gnutls found: YES 3.5.19
> 2019-01-15T04:20:30
> 2019-01-15T04:20:30 meson.build:70:0: ERROR:  Assert failed: location
> of system Certificate Authority list:  could not find any CA
> certificate store. Use -Dca_certificates_path=PATH to set
> 2019-01-15T04:20:30
> 2019-01-15T04:20:30 A full log can be found at
> /accts/mlweber1/rclinux/br-reproduce/96b287a6de9f8bae48d75ff6652f3c909e0181b0glibnetworking/buildroot/output/build/glib-networking-2.56.1/build/meson-logs/meson-log.txt
> 2019-01-15T04:20:30 make: ***
> [/accts/mlweber1/rclinux/br-reproduce/96b287a6de9f8bae48d75ff6652f3c909e0181b0glibnetworking/buildroot/output/build/glib-networking-2.56.1/.stamp_configured]
> Error 1

http://patchwork.ozlabs.org/patch/1025189/
