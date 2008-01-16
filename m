From: Rahul Kulkarni <rahul.kulkarni@oasistech.co.in>
Date: Wed, 16 Jan 2008 12:44:18 +0530
Subject: [Buildroot] Package Selection/Removal Problem
Message-ID: <1200467658.3303.10.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,
    I am using buildroot r-17130 for generating base system for my ARM9
target. I have tried adding packages through make menuconfig option of
buildroot. I was successful while doing so and to have the same packages
in final rootfs image created using make. But when i rebuild the rootfs
image removing some of the above said packages through make meuconfig,
and rebuild the buildroot,  the package executables of remove packages
do not get flushed. They remain present in new copy of roofs though are
being removed from the option selection menu.
   Is this the default behavior of buildroot? or is there any other
option to clean executables of removed packages from there
locations(root or etc directory of rootfs)?  
Best Regards,
Rahul
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080116/d75a113a/attachment.htm 
