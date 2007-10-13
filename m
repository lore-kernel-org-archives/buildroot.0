From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 13 Oct 2007 22:50:19 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/Atmel target etc...
In-Reply-To: <1192307599.26495.29.camel@elrond.atmel.sweden>
References: <20071013101502.7A6EDA6151@busybox.net>
	<d6cda7730710130954u34f6158an4a924bef423239ac@mail.gmail.com>
	<1192307599.26495.29.camel@elrond.atmel.sweden>
Message-ID: <d6cda7730710131450q781063fcl3f9dcdcac808289c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/13/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> > I for one welcome our new 4.2.x compiler overlords, but shouldn't we
> > keep 4.1.2 which is supposedly more stable, at least just as an
> > option?
> >
>
> It should be an option.
> - Actually the default.
>   The AVR32 gcc-4.2.1 will crash if Qtopia is built,
>
> You cannot select 4.1.2?

Ah, I see now... it's a bit confusing. I can select the compiler on
the Toolchain -> Source Locations, instead of --GCC Options/GCC
Compiler Version.
