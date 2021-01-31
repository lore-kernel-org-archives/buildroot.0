From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:24:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix build on pre 4.4
 kernels
In-Reply-To: <20210129050312.12247-1-fede@evolware.org>
References: <20210129050312.12247-1-fede@evolware.org>
Message-ID: <20210131232413.15c9ae9a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Federico,

On Fri, 29 Jan 2021 06:03:12 +0100
Federico Pellegrin <fede@evolware.org> wrote:

> kexec build will fail on older kernels (pre 4.4) as the define VIDEO_CAPABILITY_64BIT_BASE was not present at that time.
> 
> This patch adds it, as per linux/include/uapi/linux/screen_info.h, if not present.
> 
> Signed-off-by: Federico Pellegrin <fede@evolware.org>

Thanks a lot for your contribution! However, we need all patches added
to packages to have a proper commit log and Signed-off-by line, and be
generated using git format-patch. Could you adjust your patch
accordingly ?

Also, did you submit this change to upstream kexec ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
