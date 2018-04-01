From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Apr 2018 01:12:00 -0300
Subject: [Buildroot] [PATCH 11/36] linux/linux.mk: use namespace for
 internal variables
References: <20180331082016.18291f11@windsurf>
Message-ID: <5ac05c10c1ac5_7cbc2abf3128184019e9@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Mar 31, 2018 at 03:20 AM, Thomas Petazzoni wrote:

> Should we name them just LINUX_ARCH_PATH, LINUX_DTBS and
> LINUX_DTS_NAME, instead of LINUX_KERNEL_ARCH_PATH, LINUX_KERNEL_DTBS,
> etc. ? This would make them more consistent with the other variables
> that already exist: LINUX_VERSION_PROBE, LINUX_IMAGE_NAME, etc.
> 
> I.e, the prefix should be just LINUX_ and not LINUX_KERNEL_.

Sure, I will do.


Regards,
Ricardo
