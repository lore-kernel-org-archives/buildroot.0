From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Apr 2015 10:03:57 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add hash for 2012.07
In-Reply-To: <20150426213341.GI4809@free.fr>
References: <1430078172-8136-1-git-send-email-vincent.stehle@laposte.net>
 <20150426222755.437ae3fe@free-electrons.com>
 <20150426213341.GI4809@free.fr>
Message-ID: <20150428100357.634cf24c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 Apr 2015 23:33:41 +0200, Yann E. MORIN wrote:

> > The problem indeed exists, but this is not the right solution. The
> > right solution is to use BR_NO_CHECK_HASH_FOR. Yann, can you look at
> > all the packages that may use custom versions (U-Boot, Barebox,
> > kernel, etc.) and do the necessary BR_NO_CHECK_HASH_FOR handling?
> 
> I'll have a look.

Any updates on this? One quick option I see is to remove uboot.hash for
now.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
