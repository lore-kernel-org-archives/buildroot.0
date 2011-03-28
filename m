From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 28 Mar 2011 07:04:55 +0200
Subject: [Buildroot] [PATCH 1/1] qt: disable isascii calls when undefined
In-Reply-To: <87oc4wmgmp.fsf@macbook.be.48ers.dk>
References: <1300920852-21189-1-git-send-email-s.martin49@gmail.com>
	<87oc4wmgmp.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikgNxwUgnynX9z2Ti0Pf=jJRWSuPQE4NZ-rCsd2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok.
btw, i found the problem: just forget to enable the SUSV4_LEGACY in the
uclibc config.
Sorry for the noise.

Bye,

Samuel

2011/3/27 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
>  Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Out of interest, on what kind of setup don't you have isascii()? Have
> you sent this patch upstream to the qt people?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110328/115c9941/attachment.html>
