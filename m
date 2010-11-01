From: Matthew Davison <matt.davison@lantronix.com>
Date: Mon, 1 Nov 2010 14:47:11 -0700
Subject: [Buildroot] /var/run as ramdisk
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517F38@2putt.int.lantronix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
 
Is there a standardized way in buildroot to have the /var/run directory
mounted as a ramdisk (e.g. tmpfs)? I would like to do this to avoid
excessive erase/write cycles on the flash.
 
Thanks,
 
Matt
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101101/af89d966/attachment.html>
