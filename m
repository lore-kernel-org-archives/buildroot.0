From: yoda zhong <yodazhong@gmail.com>
Date: Wed, 7 Sep 2016 09:42:01 -0700
Subject: [Buildroot] How to flash to internal eMMC
Message-ID: <57d0435a.259b420a.73d7d.e182@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry for this additional message for flashing.
But I failed all method that I found by googling and advices from someone.

In a nutshell, I want to make my beaglebone black run by itself without microSD.
So I want to flash microSD into internal 4GB eMMC. FYI, microSD was made by following
http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf 

Someone advised to use dd command. So I checked the partitions for eMMC and microSD,
and dded. But I failed to boot up without microSD.

Someone advised to boot up by keeping pressing boot button, but there?s no lit leds and failed
to boot without microSD.

I tried all things on http://stackoverflow.com/questions/31725206/unable-to-flash-emmc-from-sd-card-beaglebone-black
But I failed.

In fact, I tried this also http://elinux.org/Beagleboard:BeagleBoneBlack_Debian#Flashing_eMMC
But I failed. It seems like this method can?t be applicable to buildroot.

What am I missing?

Best,
Jehun

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160907/4ab72e50/attachment.html>
