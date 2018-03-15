From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 15 Mar 2018 09:00:46 +0100
Subject: [Buildroot] [Need Assistance]:confused between BUILDROOT and
 OPENWRT ?
In-Reply-To: <mailman.2297.1520509432.3652.buildroot@busybox.net>
References: <mailman.2297.1520509432.3652.buildroot@busybox.net>
Message-ID: <9ab24cef09942aed44f4f983388df1ff@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kishore,

It would help if you supplied some information about what you would like 
to achieve, and in which context.

> I?m really Confused between Buildroot and OpenWrt. I mean in which 
> scenario
> one will choose OpenWrt over Buildroot.

The OpenWRT project provides Open Source firmware for routers. If you 
have one of the supported devices and you would like to continue to use 
it as a router, choose OpenWRT.

The build system of OpenWRT looks a lot like Buildroot, but was probably 
branched a long time ago ...

Buildroot itself is more flexible, but also requires more effort to get 
a working firmware image for your specific device. Buildroot supplies 
pre-configured configurations for common devices (check the configs 
folder), but these cover only bootup sequence and standard hardware, 
everything else (e.g. firmware or software to be included) you need to 
configure yourself.

Buildroot images are not supposed to be updated from the device itself, 
the normal procedure is to build and deploy a new image.

If you look for a build system to create your own distribution, take a 
look at OpenEmbedded /Yocto.

Regards,
Andreas
--
(Running OpenWRT on TP-Link devices, and Buildroot generated images on 
various media players)
