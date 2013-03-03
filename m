From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 20:52:42 +0100
Subject: [Buildroot] [PATCH] u-boot: u-boot SPL is usually under ./spl/
In-Reply-To: <CAOQ7t2ZJsu5u706BHJsuX6vOPgB5_oUJfF05EZYESpCjunvb=Q@mail.gmail.com>
References: <1362329351-7738-1-git-send-email-carlo.caione@gmail.com>
 <20130303192824.2a2faf5d@skate>
 <CAOQ7t2ZJsu5u706BHJsuX6vOPgB5_oUJfF05EZYESpCjunvb=Q@mail.gmail.com>
Message-ID: <20130303205242.423ad324@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlo Caione,

On Sun, 3 Mar 2013 19:55:48 +0100, Carlo Caione wrote:

> > In the case of OMAP, the SPL gets generated in the main source
> > directory. For which configuration do you see that it is installed only
> > in the spl/ sub-directory?
> 
> I'm trying to use buildroot to create an image for a cubieboard
> (http://cubieboard.org/).
> In this case I have to use u-boot-sunxi and SPL gets generated only in spl/

Right, I tested this, and it gets installed in spl/.

What about setting BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
