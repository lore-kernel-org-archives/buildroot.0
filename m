From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 09:39:09 +0200
Subject: [Buildroot] Docker missing statistics
In-Reply-To: <CAM27=5itBcZ_H=CEzVUA2Ow8sfOztB76ekEeWZfMEn2y9MjYpA@mail.gmail.com>
References: <CAM27=5itBcZ_H=CEzVUA2Ow8sfOztB76ekEeWZfMEn2y9MjYpA@mail.gmail.com>
Message-ID: <20180628093909.4205a5cb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jun 2018 10:19:11 +0300, Roy Arav wrote:

> 2.  I ran the following check script
> https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh
> and the result is that there are 2 kernel flags missing
> CONFIG_CGROUP_HUGETLB=y
> CONFIG_AUFS_FS=y
> 
> 3. I tried adding them and two more flags that I thought they might depend

How did you add them ?

To change the Linux kernel configuration, you need to use "make
linux-menuconfig" or "make linux-xconfig".

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
