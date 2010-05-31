From: Andrei Costin (lists) <lists@andreicostin.com>
Date: Mon, 31 May 2010 20:49:56 +0300
Subject: [Buildroot] buildroot GPL question
Message-ID: <002f01cb00e9$af8f1180$0ead3480$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I would like someone's advise for the course of action regarding a vendor
that used _buildroot_  to compile an embedded linux kernel for their
hardware product.

 

I have contacted them, and their response is below:

"Thank you for your inquiry.
Our company is using a standard BUILDROOT environment
(http://buildroot.uclibc.org/) to produce the product.
No modifications were made on original 2.6 kernel and other applications
under the GPL licence.
therefore we recommend you connect to http://buildroot.uclibc.org to get all
extra information."

 

Also, their product documentation and license doesn't mention at all GPL
license in relation to the linux kernel (and other stuff used).

 

So, given a hardware unit with embedded linux kernel built with _buildroot_,
what exact things does vendor have to provide:

-          In terms of documentation/license text?

-          In terms of source code and build environment (build and install
scripts/steps)

 

My assumptions are:

-          Documentation should mention the GPL license and the exact GPL
modules used. Also, documentation should state how to get the necessary
source code/configuration (FTP link, mailing address for CD order, etc.)

-          Source code (exact source tree or reference to an exact
version/revision) as well as exact configuration/makefiles used for building
the embedded environment (including configuration files for their buildroot
development environment) 

 

Any advise is highly appreciated. 

 

Thanks a lot

 

Kind regards,

Andrei Costin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100531/3ea62ad2/attachment.html>
