From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 3 Sep 2009 22:58:23 +0200
Subject: [Buildroot] [PATCH] buildroot: Remove old CVS relics.
In-Reply-To: <87a5b0800909031230l5ff046fen9778986b855aae76@mail.gmail.com>
References: <87a5b0800909030904w38f82856pffd93068aa27ef93@mail.gmail.com>
	<20090903161306.GC32465@mx.loc>
	<87a5b0800909031015h5da69b8aibe5cf6c92e3b293b@mail.gmail.com>
	<20090903172717.GD28419@mx.loc>
	<87a5b0800909031230l5ff046fen9778986b855aae76@mail.gmail.com>
Message-ID: <20090903205823.GF28419@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 03, 2009 at 08:30:44PM +0100, Will Newton wrote:

>I considered doing this, I'm not sure what the best way is. I don't
>think we always want to follow the latest version but expressing an

For these particular 2 packages we do (since the risk is quite low, from
my experience). YMMV.

>upstream version as a git hash is not very friendly, there aren't many
>tags in the upstream repo.

That's why we had a local co that we could pull upon need.
Perhaps you can try if that works out fine?
