From: Matthew Davison <matt.davison@lantronix.com>
Date: Wed, 7 Jul 2010 10:22:25 -0700
Subject: [Buildroot] Controlling dependencies for package with manual
	Makefile
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E39@2putt.int.lantronix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I understand that for packages using the autotools infrastructure, that
the PACKAGENAME_DEPENDENCIES variable (replacing PACKAGENAME
appropriately) is used to tell buildroot to build these dependencies
first. Setting this variable in a manual Makefile (non-autotools based),
does not appear to work.
 
Is there a way to force buildroot to build package dependencies first,
without having to convert to an autotools compliant Makefile?
 
Thanks for your help.
 
Matt
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100707/f1cf9957/attachment.html>
