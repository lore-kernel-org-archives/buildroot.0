From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 10 Sep 2008 23:26:17 +1000
Subject: [Buildroot] [PATCH] Option to disable cursor in X; retry
In-Reply-To: <200809101352.14211.michel@crondor.net>
References: <20080910081259.GB24785@aeon.hgd.crondor.net>
	<20080910110310.GB18852@cloud.net.au>
	<200809101352.14211.michel@crondor.net>
Message-ID: <20080910132617.GA21310@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 10, 2008 at 01:52:14PM +0200, Michel Wilson wrote:
> You are as surprised as I was, because it is indeed a configure-time option to 
> disable it, by default. Note that it's only the root window which is affected. 
> I think it's possible to still have a cursor, by providing a cursor theme or 
> something like that, but I haven't tested.
> Question is: should this be included or not? I feel it's a useful option to 
> have, because it's the simplest way of disabling the cursor. I tried a 

Sure, if it's useful to you there's no reason why it shouldn't go in.

I usually stay out of packages that I don't use personally, but since
I've challenged you about this it's only fair that I commit the patch
:-) It's in as r23371.

Thanks for sending the patch again. Sometimes patches slip through.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
