From: Paul B. Henson <henson@acm.org>
Date: Sat, 3 Aug 2013 19:54:21 -0700
Subject: [Buildroot] [PATCH] kobs-ng: new package
In-Reply-To: <51F87946.2090508@acm.org>
References: <20130729031743.9E00A5C125@zaphod.pbhware.com>
 <20130729205402.6fff1ad4@skate> <51F87946.2090508@acm.org>
Message-ID: <20130804025421.GD30160@bender.unx.csupomona.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 30, 2013 at 07:41:10PM -0700, Paul B. Henson wrote:
> On 7/29/2013 11:54 AM, Thomas Petazzoni wrote:
> 
> > Not sure it should be with the filesystem tools. Maybe just Hardware
> > handling?
> 
> The menu says "Filesystem and flash utilities", kobs-ng is a flash 
> utility, so it initially made sense to me. I can move it to the hardware 
> section if you prefer.

I resubmitted the patch to add kobs-ng; I think I addressed all of your
feedback other than the category. I don't think I saw a response to
this, so I left it in the flash utility category. I can move it to the
hardware handling category and resubmit if you still think that's a
better place for it.

Thanks...
