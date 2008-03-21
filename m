From: Kelvin <kelvin@willowglen.com.my>
Date: Fri, 21 Mar 2008 09:05:08 +0800
Subject: [Buildroot] Problem running Buildroot2 microcom package with Busybox
Message-ID: <01c401c88aef$9b04a990$4452a8c0@KelvinChewPC>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I'm building an embedded Linux OS using Buildroot2 with kernel version 2.4,
Busybox version 1.00 and JFFS2 filesystem. I included the microcom package
from Buildroot2 in my Linux build. However, when I boot up my built OS, I
have problem running the microcom application even though it is right there.
It gives the error "-sh: microcom: not found". Seems like the Busybox shell
is unable to locate the microcom application and run it.

 

Did anyone else see this problem before? Is this a known problem in
Buildroot2/Busybox? Any fix for it? Thanks for helping out.

 

Regards,

Kelvin

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/f5b2d32f/attachment.htm 
