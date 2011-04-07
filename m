From: Marc Leclerc <marc-leclerc@signaturealpha.com>
Date: Thu, 7 Apr 2011 13:23:32 -0400
Subject: [Buildroot] Device creation
Message-ID: <91E60E2EFEE04B0399DD86344DDEF380@VOSTROSYS>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I am trying to get linuxpps working on my board using ntp. there are 
steps described at 
http://wiki.enneenne.com/index.php/LinuxPPS_installation which says to 
use ldattach to assign the pps signal but so it seem I do not have 
ldattach on my buildroot system and tryin to compile util-linux led to 
compilation errors. Just wondering if anyone here has the know how to 
get my /dev/pps0 created and assigned to my /dev/ttyS1. the steps also
mentions using udev to get the /dev/pps0 created, i have tried installing and
using it and it just messed up my other links

Best regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110407/cdbc538e/attachment.html>
