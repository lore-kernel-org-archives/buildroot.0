From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Wed, 6 Nov 2013 16:37:26 -0600
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <87fvr9jh2h.fsf@dell.be.48ers.dk>
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>	<87eh6tkxuk.fsf@dell.be.48ers.dk>
 <20131106231048.67cf2d52@skate>
 <OFB958AF8A.71CC6ECD-ON86257C1B.007ADE85-86257C1B.007B965F@rockwellcollins.com>
 <87fvr9jh2h.fsf@dell.be.48ers.dk>
Message-ID: <OFF4942D87.38E368D2-ON86257C1B.007BE83F-86257C1B.007C242E@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Peter Korsgaard <jacmet@gmail.com> wrote on 11/06/2013 04:33:58 PM:

>  >> Same thing for architecture dependent packages: grub depends on i386
>  >> or x86-64, but ti-gfx depends on arm.
> 
>  > That is exactly the problem I was running into. As for the grep
>  > concern, I have not found another way to implement it. I needed to
>  > have a full list of all of the packages but I was not able to find
>  > said variable. I spent some time digging through the Kconfig stuff to
>  > see if there way a way to get around all of the dependencies but I
>  > could not find an easy way.
> 
> I still don't quite get why you want to download the sources of all
> package(-versions) we have in Buildroot. Can you explain in more detail?

I do all of my builds behind a very restrictive firewall that does not
allow me to download the packages.  I am able to download them from
another computer and serve up the files behind the firewall.  It is
difficult to keep the sources up to date while tracking the Buildroot
mainline. 

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
