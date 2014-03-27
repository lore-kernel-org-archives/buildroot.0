From: Sangjung <sangjung.woo@samsung.com>
Date: Thu, 27 Mar 2014 16:11:29 +0900
Subject: [Buildroot] NPTL compile error without MMU (ARM)
In-Reply-To: <20140327074058.4059aa56@skate>
References: <5333C645.8000203@samsung.com> <20140327074058.4059aa56@skate>
Message-ID: <5333CF21.8040503@samsung.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.


On 03/27/2014 03:40 PM, Thomas Petazzoni wrote:
> Thanks for your report. The problem really looks like a uClibc problem,
> so I would suggest you to take the uClibc configuration file in
> output/build/uclibc-<version>/.config, and sent the report to the
> uClibc developers. I am also on the uClibc mailing list, so I will be
> able to add additional Buildroot-specific details if requested by the
> uClibc developers.

Thank you for your quick reply.
I will also report this issue to uClibc mailing list ASAP.

>
> Outside of this, it is interesting to see that you are looking at the
> ARM non-MMU support. Do you have an actual hardware platform? In fact,
> I have been interested by looking into ARM non-MMU support in Buildroot
> for a long time, but I have never found a hardware platform, or
> emulated platform, to test things on. If this is something you can help
> with, I'm pretty sure the ARM non-MMU support would make more
> significant progress.

Our target device is for very small wearable thing.
Because of various issue such as power consumption and cost,
ARM Cortex M (that is MMU-less) series are commonly used.


BRs
Sangjung
