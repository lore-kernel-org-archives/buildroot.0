From: Mike Zick <minimod@morethan.org>
Date: Fri, 11 Apr 2014 06:51:58 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-10
In-Reply-To: <87y4zc47il.fsf@dell.be.48ers.dk>
References: <20140411063008.70B85100F1F@stock.ovh.net>
 <87d2go5oz3.fsf@dell.be.48ers.dk> <20140411093044.07729d79@skate>
 <87y4zc47il.fsf@dell.be.48ers.dk>
Message-ID: <20140411065158.0a9308de@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Apr 2014 10:04:02 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Thomas" == Thomas Petazzoni
> >>>>> <thomas.petazzoni@free-electrons.com> writes:
> 
> Hi,
> 
>  > So the part of the tarball before they start to differ, plus the
>  > size of the normal tarball, adds up to the size of the corrupted
>  > tarball. So it really seems like the corrupted tarball ends up
>  > with a copy of the correct tarball.
> 
> Funky!
> 
>  > This looks weird, and I don't have a good explanation. For now,
>  > I've removed this bogus file, and we'll see if this occurs again
>  > in the future.
> 
> Agreed. Thanks for looking into it!
> 

That reads like wget behavior, if interrupted and without the
"continue" option.

Mike
