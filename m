From: carlos at fgh.co.uk <carlos@fgh.co.uk>
Date: Wed, 21 Feb 2018 10:35:26 +0000
Subject: [Buildroot] buildroot-2017.11.1 and cape manager for Beaglebone
 Black.
In-Reply-To: <1519132146.05324245@apps.rackspace.com>
References: <1519132146.05324245@apps.rackspace.com>
Message-ID: <2f59a73010754a544d0673389f188a67@fgh.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot, you have saved me. It's working and I owe to you a couple 
of beers :)

On 2018-02-20 13:09, Scott Ellis wrote:
> You don't need cape manager for the built-in CAN controllers of the
> BBB
> 
> or to use any CAN capes with external CAN controllers that the BBB
> 
> communicates with over SPI.
> 
> It's just a matter of adding some sections to your dts. You can do it
> with
> 
> an include to your main dts.
> 
> Here are some links for dts includes to the 4.4 mainline kernel to
> enable
> 
> the built-in CAN controllers. Just a little pin muxing. This assumes
> you
> 
> have the kernel modules enabled, which you probably do.
> 
> The cape manager stuff was never supported by mainline linux or even
> TI
> 
> linux kernels only the Beaglebone specific kernels. And it's not even
> 
> supported by the Beagleboard folks anymore.They have moved to a u-boot
> 
> 
> approach.
> 
> Cape manager is a technological dead-end.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
