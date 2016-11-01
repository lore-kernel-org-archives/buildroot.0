From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:10:55 +0100
Subject: [Buildroot] [PATCH 4/4] board/lego/ev3: Use ev3dev linux ext
 for ev3dev drivers
In-Reply-To: <1477870346-4941-5-git-send-email-david@lechnology.com>
References: <1477870346-4941-1-git-send-email-david@lechnology.com>
 <1477870346-4941-5-git-send-email-david@lechnology.com>
Message-ID: <20161101161055.1cb240bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 18:32:26 -0500, David Lechner wrote:
> This uses the ev3dev linux extension to compile the ev3dev drivers for
> LEGO MINDSTORMS EV3.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

This also looks good, but please use a defconfig fragment for enabling
the Linux drivers. Note that you can use several fragments: one to
enable squashfs/ramdisk, and one to enable the lego drivers. It's not
mandatory, but it can be done this way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
