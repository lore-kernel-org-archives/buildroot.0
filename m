From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 10 Oct 2011 11:22:48 -0400
Subject: [Buildroot] [PATCH 9/9] toolchain: speed up sysroot lib copying
In-Reply-To: <20111010171919.268be9d6@skate>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <201110101112.18026.vapier@gentoo.org> <20111010171919.268be9d6@skate>
Message-ID: <201110101122.49584.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 10 October 2011 11:19:19 Thomas Petazzoni wrote:
> Le Mon, 10 Oct 2011 11:12:16 -0400, Mike Frysinger a ?crit :
> > the people who still do are using buildroot for Blackfin, but sadly, they
> > were (are?) not as active as i in pushing upstream
> 
> Ah, that's a shame, because your contributions were very interesting.
> Do those people have a public tree where we can follow their
> development and possibly upstream some of it ?

yes & no.  it's supposed to be here:
	http://blackfin.uclinux.org/git/?p=buildroot

but it seems they haven't published their internal development tree yet, and i 
obviously cannot do that for them
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111010/cae6714b/attachment.asc>
