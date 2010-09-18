From: Martin Banky <Martin.Banky@gmail.com>
Date: Sat, 18 Sep 2010 14:36:22 -0700
Subject: [Buildroot] [PATCH 05/21] bison: bump to 2.4.3
In-Reply-To: <20100918190216.07a65e03@surf>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-5-git-send-email-Martin.Banky@gmail.com>
	<20100918190216.07a65e03@surf>
Message-ID: <AANLkTin2ikMjYT0T8hPhq1e-ptTkYdXJPjT1hRt4Se1d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
     Sorry, I thought that I had attributed this to the original author, but
alias, I did not. The original author is Michael Deutschmann. See here for
the discussion, http://www.mail-archive.com/uclibc at uclibc.org/msg05169.html.

Martin

On Sat, Sep 18, 2010 at 10:02 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Mon, 13 Sep 2010 20:40:32 -0700
> Martin Banky <martin.banky@gmail.com> wrote:
>
> > +
> > + /* Get definitions of 'struct sched_param' and 'sigset_t'.
> > +    But avoid namespace pollution on glibc systems.  */
> > +-#ifndef __GLIBC__
> > ++#if 1
>
> Why ? This seems to contradict the comment above.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100918/2abad883/attachment-0001.html>
