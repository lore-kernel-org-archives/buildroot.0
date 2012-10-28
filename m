From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Oct 2012 10:36:07 +0100
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools
	shared library
In-Reply-To: <20121025182332.GC5178@tarshish> (Baruch Siach's message of "Thu, 
 25 Oct 2012 20:23:32 +0200")
References: <50897A02.7000407@rie.eu> <20121025182332.GC5178@tarshish>
Message-ID: <87wqybhraw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Hi Michael,
 Baruch> On Thu, Oct 25, 2012 at 07:42:26PM +0200, Michael Stieler wrote:
 >> we are using buildroot for arm development. we are migrating from
 >> arm926t to AM3358 and AM3359.
 >> 
 >> i was hoping to continue to use buildroot for the processors, but i
 >> cannot build the right compiler for these 2.
 >> 
 >> in make menuconfig i choose:
 >> 
 >> target architecture ARM (big endian)

 Baruch> Why big endian? As far as I know all TI SoCs (as almost all ARM
 Baruch> SoCs) are little endian.

Indeed. We already have a beaglebone (am3358) defconfig
(configs/beaglebone_defconfig).

-- 
Bye, Peter Korsgaard
