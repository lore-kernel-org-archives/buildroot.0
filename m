From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:13:37 +0100
Subject: [Buildroot] [PATCH 0/4] mender updates
In-Reply-To: <20210307222536.2743089-1-aduskett@gmail.com>
References: <20210307222536.2743089-1-aduskett@gmail.com>
Message-ID: <20210314231337.356ddf94@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Mar 2021 14:25:32 -0800
aduskett at gmail.com wrote:

> Adam Duskett (4):
>   package/mender-artifact: bump to version 3.4.1
>   package/mender: bump version to 2.4.2
>   package/mender-grubenv: bump version to
>     f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b

Thanks, I've applied those patches to master!

>   package/mender: Do not automatically select uboot tools if uboot is
>     selected

I do have a few comments/questions on this one, so I'll reply to it
directly.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
