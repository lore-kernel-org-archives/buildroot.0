From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 16 Feb 2012 08:56:30 +0100
Subject: [Buildroot] [RFC PATCH v2 4/6] apply-patches.sh: directories
 are considered as a collection of patches
In-Reply-To: <201202160049.24485.arnout@mind.be>
References: <20120215165104.GI4723@ldesroches-Latitude-E6320>
 <1329347174-25471-1-git-send-email-ludovic.desroches@atmel.com>
 <201202160049.24485.arnout@mind.be>
Message-ID: <20120216075630.GA2943@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Thu, Feb 16, 2012 at 12:49:24AM +0100, Arnout Vandecappelle wrote:
> On Thursday 16 February 2012 00:06:14 ludovic.desroches at atmel.com wrote:
> > Behaviour of directories is changed: it is no more considered as an overlay,
> > but rather a collection of patches. Subdirectories are not supported.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
>  BTW, if you update a few patches out of a series, it is usually better
> to repost the entire series.  Otherwise there's a risk of some patches
> getting lost.
> 

Agree, I will try to build more packages in order to see if nothing is broken,
then I will publish again the whole series without the RFC tag.

Regards

Ludovic
