From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 00:31:50 +0200
Subject: [Buildroot] [PATCH 2/2] qemu: add support for python 3.6
In-Reply-To: <20180427154055.23272-2-aduskett@gmail.com>
References: <20180427154055.23272-1-aduskett@gmail.com>
 <20180427154055.23272-2-aduskett@gmail.com>
Message-ID: <20180821003150.677ad122@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Apr 2018 11:40:55 -0400, Adam Duskett wrote:
> qemu 2.12.0 now supports building against python3.
> see: https://wiki.qemu.org/ChangeLog/2.12#Build_Dependencies
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/qemu/qemu.mk | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)

You posted this patch on April 27, and got some review on May 1 from
Romain, but never replied. I am marking this patch as Changes
Requested. Could you send an updated version when you have some time ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
