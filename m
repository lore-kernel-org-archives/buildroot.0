From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 15:45:48 +0200
Subject: [Buildroot] [PATCH] Bump linux kernel and u-boot versions
In-Reply-To: <1465564039-21759-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1465564039-21759-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Message-ID: <20160610154548.3843b19b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 16:07:19 +0300, Eugeniy Paltsev wrote:
> Update kernel version to the most recent stable as of today 4.6.2
> with back-ported ARC PGU support from 4.7-rc2.

What about using 4.7-rc2 directly? By the time the next Buildroot
release will be made, the final 4.7 will have been released, so you
will have the opportunity to adjust the defconfig to use the final 4.7.

But at least, in the mean time, we don't have to carry huge patches in
Buildroot, especially feature patches (like the display controller
driver), which we don't like to carry in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
