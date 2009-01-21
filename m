From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Wed, 21 Jan 2009 11:00:41 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

After updating to a fresh buildroot (r24922) configured with at91sam9263ek_defconfig, the busybox login with "root" and no password doesn't work any more. The login prompt shows up, and the login seems to work fine, but then it quits and throws me back to the login prompt again:


Welcome to the Erik's uClibc development environment running on an AT91SAM9261EK
AT91SAM9263EK login: root
Dec 31 17:00:15 login[925]: root login on 'ttyS0'



Welcome to the Erik's uClibc development environment running on an AT91SAM9261EK
AT91SAM9263EK login: 


Changing the busybox version from 1.13.x to 1.10.x solves the problem, so I guess something must have been changed in that time affecting the login process.

Best regards,
Robin Stridh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090121/e5b748f2/attachment.htm 
