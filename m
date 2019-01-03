From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 3 Jan 2019 21:54:19 +0100
Subject: [Buildroot] [PATCH 00/11] support/download: fix scp and
 reintroduce source-check
In-Reply-To: <20190103214654.435a7043@windsurf>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103214654.435a7043@windsurf>
Message-ID: <CAAXf6LVUvjymZVheDA2ihJ5ifmrB26p2d0Hm2aeaV3UahEOG=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 3, 2019, 21:46 Thomas Petazzoni <thomas.petazzoni@bootlin.com
wrote:

> Hello,
>
> On Thu,  3 Jan 2019 21:40:15 +0100, Thomas De Schampheleire wrote:
>
> > Hello and happy 2019 to you all!
> >
> > This series has two parts:
> > 1. fix the broken scp download helper (seems no-one is using it on recent
> >    releases?) (patches 1 and 2)
>
> Indeed, I believe the scp download method is rarely used and tested. The
> only solution to not break it again is to have proper tests for it in
> support/testing/. Should it be part of your patch series ? :-)
>

But how to generically test it? It requires a configured ssh server, which
is not even guaranteed on localhost.

/Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190103/c9e4942c/attachment.html>
