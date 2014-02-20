From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 21:08:57 +0100
Subject: [Buildroot] [PATCH 1/1] Updated package download address. Added
 staging option so that applications that depend on rtai's headers may be
 built by buildroot. Re-directed the include dir to /usr/include/rtai.
In-Reply-To: <1795639.hLW96TZBfD@eclipse>
References: <1392913567-4146-1-git-send-email-andy@outsideglobe.com>
 <20140220173703.2a8b802b@skate> <1795639.hLW96TZBfD@eclipse>
Message-ID: <20140220210857.3907b772@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrew Barnes,

On Thu, 20 Feb 2014 16:49:03 +0000, Andrew Barnes wrote:

> Technically no. I did it all with 4.0, but we agreed that changing the version 
> number should be a separate patch. Although I don't think there would be a 
> problem applying the same changes to 3.9 (I am very sure the project 
> infrastructure is identical) I do see the need to test this first. I'm not 
> quite in a position to test it at the moment.
> 
> what are the next steps, do I resubmit with changes in exactly the same way?  
> i initially submitted?

I'd say you can probably include the bump to 4.0 in the same patch.
Normally we prefer patches that do one thing and only one thing, but in
this case, the changes are relatively small, so maybe just one patch
is good enough.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
