From: Benjamin Tietz <benjamin@micronet24.de>
Date: Wed, 1 Aug 2007 09:35:55 +0200
Subject: [Buildroot] touch menuconfig
In-Reply-To: <28024.24.217.29.51.1185951980.squirrel@kujawski.org>
References: <016801c7d404$a2834ca0$dcc4af0a@atmel.com>
	<28024.24.217.29.51.1185951980.squirrel@kujawski.org>
Message-ID: <20070801073555.GA4550@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just to have commandline-completion you dont have to put another silly
file in the directory confusing/annoying anyone.
See the section "Programmable Completion" in man 1 bash / your favorite
shell.

regards
Benjamin

On Wed, Aug 01, 2007 at 02:06:20AM -0500, Frank Kujawski wrote:
>   I don't have an objection to the file and command completion, but I wonder
> what could be put in the file?
>   What hints could be placed in the file that would be of aid?  At first
> thought it would be hints, but then that is what is in docs, so my next
> thought is a link to a hint file in docs, perhaps docs/README.
>   My 2c,
>     Frank
> 
> > I find it quite useful to have an empty file "menuconfig" in the top
> > directory,
> > so I can get command completion when doing
> >
> > $ make menuconfig
> >
> > Any objections to adding this?
> >
> > Best Regards
> > Ulf Samuelsson
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
