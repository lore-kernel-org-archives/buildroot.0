From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 03 Jan 2013 02:03:00 +0200
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <20130102200144.5ed56106@skate>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com> <20130102175740.359fc5ce@skate>
 <50E48268.401@zacarias.com.ar> <20130102200144.5ed56106@skate>
Message-ID: <50E4CAB4.3010908@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

2.1.2013 21:01, Thomas Petazzoni kirjoitti:
> Hello,
>
> On Wed, 02 Jan 2013 15:54:32 -0300, Gustavo Zacarias wrote:
>
>> All of the xf86-video-sun* drivers can be safely removed, even the
>> cg6, they're Sun workstation (SPARC) specific. And they're SBUS or
>> UPA which is a propietary Sun bus.
>> C&T, Rendition and Tseng haven't produced any video chip like for ages
>> now (10+ years). They don't even exist anymore.
>> For SiS (non-USB) i think i still got one ebox2300 (mini pc) that uses
>> one of those if it needs testing - though it was working last time i
>> tried with buildroot so no reason to think it broke.
> Here I'm really only removing things that the X.org project considers
> as unmaintained. So I would prefer if you could raise the fact that the
> SiS driver is still useful to the X.org people, so that they keep this
> driver. I don't think we can reasonably keep an unmaintained X.org
> driver in Buildroot if we want to easily continue to upgrade the other
> X.org packages.

I happen to have old (from 2005) laptop with integrated SiS inside it,
gathering dust.

Does that count ?
:-)

Last time I tried it with my buildroot build linux distro it worked like
a charm.
Actually better than that. For all the various linux distros and flavors
I have
stuffed into that crappy lil laptop, this was the fastest :-)


Stefan
