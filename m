From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Feb 2009 13:09:50 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <877i3h4k5z.fsf@macbook.be.48ers.dk>
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
	<20090222232955.GA10011@buzzloop.caiaq.de>
	<877i3h4k5z.fsf@macbook.be.48ers.dk>
Message-ID: <20090223120950.GB16934@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 23, 2009 at 09:44:24AM +0100, Peter Korsgaard wrote:
>  Daniel> Yes, true, forgot to mention that. We locally patched to use
>  Daniel> 1.0.19 but that was merely because I hoped to fix the problem
>  Daniel> by that - the same problem exists with 1.0.18. And I got this
>  Daniel> problem since a long time and always patched my way around it
>  Daniel> (by overriding the value with some hard-coded constant) as I
>  Daniel> thought it is a minor issue that will be fixed sooner or
>  Daniel> later. But as it turns out, the problem seems to be bigger
>  Daniel> and might also have other impact than just that single
>  Daniel> failing function call.
> 
> Please report those kind of problems to us so we have a chance to fix
> them. This is the first I hear of it.

I'm playing ping-pong between the two lists now, and over there they
pointed out that this was indeed reported quite a while ago:

	http://lists.busybox.net/pipermail/buildroot/2008-July/009884.html

Anyway, let's make sure to apply this patch asap :)

Daniel
