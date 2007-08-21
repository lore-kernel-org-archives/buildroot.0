From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 21 Aug 2007 14:48:35 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <20070821133208.GA17177@aon.at>
References: <20070820130014.12B6AA466E@busybox.net>
	<00c801c7e345$cb1db9c0$dcc4af0a@atmel.com>
	<0708202018120.9013@somehost> <20070821133208.GA17177@aon.at>
Message-ID: <d6cda7730708210648x16b6c532g34996c2e184a83a7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   Well, if someone is willing to do a quick script to check the
whitespace stuff, I would say let him. It's not like one is loosing
anything, and it makes it easier to make sure. Though one can be
careful enough to avoid the whitespace issue, automated checks (and
checks alone, not fixups! ) is A Good Thing (tm) imho. It could even
be used in SVN hooks to deny commits that are invalid, but I'm not
quite sure if it's possible to apply it just to Makefiles and *.mk.

   Just my 2 euro cents :)

On 8/21/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Mon, Aug 20, 2007 at 08:18:46PM +0200, Cristian Ionescu-Idbohrn wrote:
> >On Mon, 20 Aug 2007, Ulf Samuelsson wrote:
> >
> >> Thanks, maybe we should have a script which is periodically run to find
> >> the white space stuff and remove it.
> >
> >Easiest is to avoid putting it there, IMHO.
>
> Agree. Not adding code that breaks the established style is the proper
> thing to do. Automated fixup is not a solution nor desirable. It's not
> that avoiding silly whitespace damage should be _that_ hard (modulo in
> an X11 impl or the like ;).
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
