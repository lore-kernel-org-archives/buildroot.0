From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 15 Mar 2012 09:27:53 +0100
Subject: [Buildroot] [PATCH 5/6] apply-patches.sh: change archive
 management
In-Reply-To: <20120314224314.0bc538d9@skate>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
 <1331739237-29872-6-git-send-email-ludovic.desroches@atmel.com>
 <20120314224314.0bc538d9@skate>
Message-ID: <20120315082753.GL2725@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 14, 2012 at 10:43:14PM +0100, Thomas Petazzoni wrote:
> Le Wed, 14 Mar 2012 16:33:56 +0100,
> ludovic.desroches at atmel.com a ?crit :
> 
> > From: Ludovic Desroches <ludovic.desroches@atmel.com>
> > 
> > The way archives were managed was incorrect because the uncompressed archives
> > were sent directly to the patch command. It means that alphabetical patch
> > order was not respected.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > with an armadeus_apf9328_defconfig build
> 
> I was initially a bit surprised by the usage of --strip-components=1,
> which means that the tarball must contain one directory, and this
> directory should contain all the patches. I kind of excepted the
> patches to be at the root of the tarball, but I don't feel very
> strongly about this, so:
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

A comment is really missing here to explain why I used it. In fact, it's quite
old and this set of patches has changed a lot from the first version. I can't
remember why I used it and if it is still needed.

I will keep you inform if I remember in which case I need it.


Regards

Ludovic
