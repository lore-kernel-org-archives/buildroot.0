From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 24 Apr 2008 12:24:10 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbset
In-Reply-To: <20080424090323.3A4B23C7E0@busybox.net>
References: <20080424090323.3A4B23C7E0@busybox.net>
Message-ID: <1209032650.13600.3.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-04-24 at 02:03 -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-04-24 02:03:22 -0700 (Thu, 24 Apr 2008)
> New Revision: 21823
> 
> Log:
> fbset: use .patch.$ARCH naming convention
> 
> 
> Added:
>    trunk/buildroot/package/fbset/fbset-2.1-support.patch.avr32
> 

It is actually fine to kill this patch now. The pclk stuff to fbset is
not needed for AVR32 architecture anymore.

Setting pclk polarity is done in the board code in the Linux kernel now.

<snipp diff>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
