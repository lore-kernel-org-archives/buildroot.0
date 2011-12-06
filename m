From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Tue, 06 Dec 2011 18:59:02 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <201112060956.07523.minimod@morethan.org>
References: <4EDE32C3.7020400@neotion.com>
 <201112060956.07523.minimod@morethan.org>
Message-ID: <4EDE57E6.4040007@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 12/06/2011 04:56 PM, Michael S. Zick wrote:
> SquashFS is a read-only file system.
> 
> So which of the "device support" options did you choose?
> You'll need one that puts devices in something writable, like tmpfs.
> 
Hi Michael,
thank you for your answer.

I'm not sure what you mean by "device support" options.
I enabled mdev and in the kernel's generic driver options, I checked "Maintain a devtmpfs filesystem to mount at /dev"
and "Automount devtmpfs at /dev after the kernel mounted the rootfs"

regards,

-- 
Emmanuel
