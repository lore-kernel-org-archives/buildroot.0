From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 13 Sep 2013 15:57:25 -0500
Subject: [Buildroot] [PATCH 1/1] uboot: add support for a uEnv.txt file
In-Reply-To: <523378A4.6080904@mind.be>
References: <1379029303-17804-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20130913090134.2b05d3e8@skate>
 <OFD202041F.E301E6A3-ON86257BE5.004F84A9-86257BE5.00503B17@rockwellcollins.com>
 <523378A4.6080904@mind.be>
Message-ID: <OF356D29CC.BBCF963A-ON86257BE5.00723ED0-86257BE5.00731EEC@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout/Thomas Petazzoni,

Arnout Vandecappelle <arnout@mind.be> wrote on 09/13/2013 03:42:12 PM:

> >
> > Well I do agree that it isn't difficult to place in post-build/image 
script
> > which is how I currently do things. My thought with adding it here is 
that
> > it is a potential alternative to an Environment image. I didn't know 
about
> > this feature until just within the last couple months and I always 
keep
> > forgetting it is an option. So placing it under the "Environment 
image"
> > may open some eye's that this option exists for them. It seems like 
more
> > and more boards are adapting this feature.
> 
>   I'm with Thomas on this one. It's not buildroot's mission to replace 
> the documentation of the underlying tools/packages. If there is 
something 
> simple that we can do that saves the user a lot of time, let's go for 
it, 
> but otherwise buildroot should be about building upstream code.

Alright, I understand that it is not buildroot's mission to replace the 
documentation of the underlying tools/packages. I can take all of that 
information out if that would help if wanted. I guess I was just offering 
this up as an alternative to Environment image when browsing through the 
menuconfig. 

At the end of the day if you don't feel this is best to be in buildroot, 
I'm fine with leaving this out as I spent all of 10 minutes on 
implementing this so I don't have much invested in this.

Thanks,
-Ryan


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130913/1ca4a2d7/attachment.html>
