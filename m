From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 08 May 2018 03:46:21 +0000
Subject: [Buildroot] [PATCH v2 1/1] zeromq: check if -latomic is needed
In-Reply-To: <20180507232430.7d507c55@windsurf>
References: <20180507202623.29498-1-asafka7@gmail.com>
 <20180507232430.7d507c55@windsurf>
Message-ID: <CALFsTFV4MUFtydH3nC2M=h5W+3bn+gp54MAciwOzGKEvddym8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sure, I'll send an update on the upstream.
Would it be necessary to send a new patch here? It will probably be the
same code, just the pull request link on the commit message will change
(and we won't be able to have a link with all the patch anyway since half
of it was already merged).

Thanks,
Asaf.

On Tue, May 8, 2018, 00:24 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Mon,  7 May 2018 23:26:23 +0300, Asaf Kahlon wrote:
> > Fixes:
> >
> http://autobuild.buildroot.net/results/b149aa2ee00e4d6a53c884cf99ecb2dd8af58b65/
> >
> http://autobuild.buildroot.net/results/e4b3616ac2695d3b6898185a70da6509b1faa2b8/
> >
> > Patch the package to check if -latomic is needed to be added, depending
> on the
> > result of AC_LINK_IFELSE.
>
> Thanks for this new iteration.
>
> > The patch was sent to upstream, see:
> > https://github.com/zeromq/libzmq/pull/3083
>
> Sadly, this pull request corresponds to the previous iteration, and it
> has been merged. Perhaps you can send a follow-up patch upstream to
> improve the situation ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180508/877c8506/attachment.html>
