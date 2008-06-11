From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 11 Jun 2008 17:41:21 +0200
Subject: [Buildroot] Still no answer for a contribution made in March
In-Reply-To: <46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com>
References: <20080611161156.33737116@crazy>
	<46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com>
Message-ID: <20080611154121.GI3795@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2008 at 11:08:49AM -0400, John Voltz wrote:
>Hi Thomas,
>
>I would have expected Ulf to take care of your patch since he usually
>handles most of the ARM stuff. I've noticed that one of the important
>methods of working with free software is to be able to make the changes
>directly yourself. So I would email Erik for subversion access, and drop it
>in there myself.

Yea, and that's the reason why the svn-repo is completely fux0red up.

>                 If nobody on the list seems to be actively doing things,
>just do it yourself. It's not because nobody cares or nodoby is interested,
>people like me only work on it in our spare time. Also, I don't know
>anything about the ARM so I try to avoid making changes in areas I can't
>support in the future.

I have applied it but i suspect that it's not really correct to just build
libc with interwork and building _everything_ else without it. Not much
harm since one can turn it off easily until somebody takes a close look.

Also the location in the configs was not really appropriate.
>
>Just my two cents.

make that four
