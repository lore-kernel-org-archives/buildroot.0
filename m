From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Wed, 6 Nov 2013 17:08:00 -0600
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <87bo1xjgnh.fsf@dell.be.48ers.dk>
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>	<87eh6tkxuk.fsf@dell.be.48ers.dk>
 <20131106231048.67cf2d52@skate>
 <OFB958AF8A.71CC6ECD-ON86257C1B.007ADE85-86257C1B.007B965F@rockwellcollins.com>
 <87fvr9jh2h.fsf@dell.be.48ers.dk>	<OFF4942D87.38E368D2-ON86257C1B.007BE83F-86257C1B.007C242E@rockwellcollins.com>
 <87bo1xjgnh.fsf@dell.be.48ers.dk>
Message-ID: <OF6541BC45.7225EF6A-ON86257C1B.007DEB0B-86257C1B.007EF0DE@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Peter Korsgaard <jacmet@gmail.com> wrote on 11/06/2013 04:42:58 PM:

> From: Peter Korsgaard <jacmet@uclibc.org>
> To: clshotwe at rockwellcollins.com
> Cc: Peter Korsgaard <jacmet@uclibc.org>, buildroot at busybox.net, 
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date: 11/06/2013 04:43 PM
> Subject: Re: [RFC] core: Download all package sources
> Sent by: Peter Korsgaard <jacmet@gmail.com>
> 
> >>>>> "clshotwe" == clshotwe  <clshotwe@rockwellcollins.com> writes:
> 
> Hi,
> 
>  >> I still don't quite get why you want to download the sources of all
>  >> package(-versions) we have in Buildroot. Can you explain in more 
detail?
> 
>  > I do all of my builds behind a very restrictive firewall that does 
not
>  > allow me to download the packages.  I am able to download them from
>  > another computer and serve up the files behind the firewall.  It is
>  > difficult to keep the sources up to date while tracking the Buildroot
>  > mainline. 
> 
> So you have git access but not generic http access? An alternative could
> be to grab the sources from sources.buildroot.net instead (but I only
> update that one every wednesday).
> 
> You can get the needed tarball names using 'make external-deps'.
> 
> -- 
> Bye, Peter Korsgaard

The firewall rules are very difficult to navigate around but we have
ways of getting git access. I could see this feature also being very
helpful for you to grab sources for the sources.buildroot.net.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/946674bf/attachment.html>
