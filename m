From: Noel Roberts <Noel.Roberts@brisbane.qld.gov.au>
Date: Wed, 28 Nov 2012 05:05:29 +0000
Subject: [Buildroot] PATCH > To integrate pycrypto into Buildroot
Message-ID: <07407110F438184D9D87521726FF42D41F64FE15@M357PRD1.ad.bcc.qld.gov.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch allows Buildroot to cross compile the crypto libraries needed for python integration, enabling good cryptographic support within Python.

This is my first patch submission - please advise me, if I need to rework anything.

[Below is the original developer?s permission for inclusion]

Regards
Noel

From: Dwayne Litzenberger [mailto:dlitz at dlitz.net]
Sent: Wednesday, 28 November 2012 9:01 AM
To: Noel Roberts
Subject: Re: Including pycrypto in Buildroot

You don't need my permission. Go nuts!

Out of curiosity, what uses PyCryptoin buildroot?

Noel Roberts <Noel.Roberts at brisbane.qld.gov.au<mailto:Noel.Roberts@brisbane.qld.gov.au>> wrote:
Good day

Would you object to me submitting a patch to buildroot, to allow the inclusion of pycrypto within the buildroot environment?

Regards
Noel


**************************************************** This message has passed through an insecure network. Please direct all enquiries to the message author. ****************************************************

**************************************************** This message has passed through an insecure network. Please direct all enquiries to the message author. ****************************************************

****************************************************
This message has passed through an insecure network.
Please direct all enquiries to the message author.
****************************************************
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121128/5d0f509c/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Adding-pyCrypto-functionality-in-Buildroot.patch
Type: application/octet-stream
Size: 1759 bytes
Desc: 0001-Adding-pyCrypto-functionality-in-Buildroot.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121128/5d0f509c/attachment.obj>
