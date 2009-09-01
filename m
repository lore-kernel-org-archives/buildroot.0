From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 2 Sep 2009 00:59:17 +0200
Subject: [Buildroot] [PATCH] libarchive package added
In-Reply-To: <87ocpupueq.fsf@macbook.be.48ers.dk>
References: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
	<87skf6pvi6.fsf@macbook.be.48ers.dk>
	<20090901150717.GC17682@buzzloop.caiaq.de>
	<87ocpupueq.fsf@macbook.be.48ers.dk>
Message-ID: <20090901225917.GE9410@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 01, 2009 at 05:16:29PM +0200, Peter Korsgaard wrote:
>  Daniel> We need that library for a binary which is linked
>  Daniel> statically. Installing it is not necessary in our case.
> 
>  Daniel> But as the default is 'y', this should not be a disadvantage
>  Daniel> for anyone.  We could, of course, also delete it manually at a
>  Daniel> later point.
> 
> Ok, we don't normally do this per-package - So I'm hessitant to add it
> here. Other than that, it looks fine.

Hmm, maybe that should be an option to more packages then, and it could
be added on demand, eg. whenever someone needs that.

But I understand that you're hessitant, so drop that part if you like,
and we remove the installed files later from our postbuild script. No
problem :)

Daniel
