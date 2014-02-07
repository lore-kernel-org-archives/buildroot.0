From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Fri, 07 Feb 2014 10:00:39 +0100
Subject: [Buildroot] Antw:   build speedup possible?
In-Reply-To: <52F49E9D.2020506@andin.de>
References: <52F49E9D.2020506@andin.de>
Message-ID: <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andreas,

This is not a solution more my experience:

I'm using a 4 Core 3.2 GHz on a Fedora 20 system and for a at91sam9x5ek_defconfig it takes about 7 min from 0 (without an downloaded DLs) to a bootable Image.

During build I'm using GKrellM System Monitor and and shows me that all cores are in use. ATM I'm ok with these results, since i started with a compile time about 45 min.

Regards,

Frank

>>> Andreas Naumann <dev@andin.de> 07.02.14 9.52 Uhr >>>
Hi guys,

First of all kudos again for this very good tool! I'm using it almsot 
daily and am stoked about the functionality but simple usage at the same 
time.
Now one issue with build systems is always build time. It seems the 
speed is not impacted much by just spending more horsepower (cpu cores). 
When looking at the load I see very frequently that just one core is 
busy with one package, especially during the configure step. Some 
packages themselves are build with just one core, I guess we cant do 
very much about that.
However, why are independent packages not build in parallel? Are the 
dependencies too complex to make this work? Thanks for any insight!


cheers,
Andreas

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140207/fb0e750a/attachment.html>
