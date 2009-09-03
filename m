From: Will Newton <will.newton@gmail.com>
Date: Thu, 3 Sep 2009 20:30:44 +0100
Subject: [Buildroot] [PATCH] buildroot: Remove old CVS relics.
In-Reply-To: <20090903172717.GD28419@mx.loc>
References: <87a5b0800909030904w38f82856pffd93068aa27ef93@mail.gmail.com>
	<20090903161306.GC32465@mx.loc>
	<87a5b0800909031015h5da69b8aibe5cf6c92e3b293b@mail.gmail.com>
	<20090903172717.GD28419@mx.loc>
Message-ID: <87a5b0800909031230l5ff046fen9778986b855aae76@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 3, 2009 at 6:27 PM, Bernhard
Reutner-Fischer<rep.dot.nop@gmail.com> wrote:
> On Thu, Sep 03, 2009 at 06:15:15PM +0100, Will Newton wrote:
>
>>Is this patch more appropriate?
>>
>>Subject: [PATCH] gnuconfig: Remove obsolete files and CVS directories.
>>
>>gnuconfig is maintained in git these days, so the CVS directories are of
>>no use. Also update config.sub and config.guess to 2009-08-19.
>
> It would be handy to knit that external repo to
> package/gnuconfig/config then, no?
>
> Alternatively you can "download" (i.e. clone) it instead of downloading
> a .tar. I think i've done this for libtool and/or gpm in my tree, if
> you're curious.
>
> Just a thought..

I considered doing this, I'm not sure what the best way is. I don't
think we always want to follow the latest version but expressing an
upstream version as a git hash is not very friendly, there aren't many
tags in the upstream repo.
