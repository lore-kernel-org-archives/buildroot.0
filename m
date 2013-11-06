From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 23:33:58 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <OFB958AF8A.71CC6ECD-ON86257C1B.007ADE85-86257C1B.007B965F@rockwellcollins.com>
 (clshotwe@rockwellcollins.com's message of "Wed, 6 Nov 2013 16:31:23
 -0600")
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 <87eh6tkxuk.fsf@dell.be.48ers.dk> <20131106231048.67cf2d52@skate>
 <OFB958AF8A.71CC6ECD-ON86257C1B.007ADE85-86257C1B.007B965F@rockwellcollins.com>
Message-ID: <87fvr9jh2h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "clshotwe" == clshotwe  <clshotwe@rockwellcollins.com> writes:

 >> Same thing for architecture dependent packages: grub depends on i386
 >> or x86-64, but ti-gfx depends on arm.

 > That is exactly the problem I was running into. As for the grep
 > concern, I have not found another way to implement it. I needed to
 > have a full list of all of the packages but I was not able to find
 > said variable. I spent some time digging through the Kconfig stuff to
 > see if there way a way to get around all of the dependencies but I
 > could not find an easy way.

I still don't quite get why you want to download the sources of all
package(-versions) we have in Buildroot. Can you explain in more detail?

-- 
Bye, Peter Korsgaard
