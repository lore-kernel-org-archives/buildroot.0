From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 14:00:19 -0300
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
 support
In-Reply-To: <20141118175637.49a03275@free-electrons.com>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>	<1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>	<CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>	<546B5779.9010708@zacarias.com.ar>	<20141118162020.02921a54@free-electrons.com>	<546B7395.4040804@zacarias.com.ar>
 <20141118175637.49a03275@free-electrons.com>
Message-ID: <546B7B23.9030004@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/2014 01:56 PM, Thomas Petazzoni wrote:
> What do you call the full multilib dance?
> 
> I guess if we go multilib, we should build the C library for both
> "variants", but then build the rest of the userspace with only one of
> the two variants, and keep the other variant just to build the special
> stuff (kernel, bootloader, etc.).

Building all (necessary) libraries as well to accomodate for ugly BLOBs
like the flash plugin or other cr^H^Hstuff like that, say i386 zlib and
more.
I don't think we want that.
Regards.
