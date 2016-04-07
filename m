From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Thu, 7 Apr 2016 11:04:02 +0000
Subject: [Buildroot] [PATCH v4 1/3] package/radlib: kconfig and makefile
In-Reply-To: <57058BC3.1070105@mind.be>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-2-git-send-email-ray.kinsella@intel.com>
 <57058BC3.1070105@mind.be>
Message-ID: <1460027041.3176.5.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, 2016-04-07 at 00:20 +0200, Arnout Vandecappelle wrote:
>   Very quick feedback, not a detailed review.
> 
>   First of all, the three patches should be squashed into one,
> because all three
> are needed to have a functional package. Otherwise, the build would
> be broken
> between the patches.
> 

Confused, just doing what I was asked in the previous review. 
Can you offer a little more guidance on how I should structure. 

Agree that you need all the pieces for a functional package. 

On Tue, 2016-03-29 at 20:07 +0200, Thomas Petazzoni wrote:
> Hello,
> So you're doing three different things. Which calls for three
> different
> patches.
> 
> I'll do a full review once you send it with git send-email, because
> the
> line wrapping makes it really hard to follow.
