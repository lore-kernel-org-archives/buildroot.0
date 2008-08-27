From: Tim Barr <tbarr@multitech.com>
Date: Wed, 27 Aug 2008 11:25:22 -0500
Subject: [Buildroot] Adding new processors and boards to buildroot
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60D766F2A@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason make 3.81 causes errors trying to compile uboot 1.3.3
which is why they have not moved uboot from 1.2 to 1.3 in buildroot, as
I understand it. We saw the same problem, but using make 3.80 instead of
make 3.81, we were bale to compile uboot 1.3.3 without errors. 

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com



> -----Original Message-----
> From: Bernhard Reutner-Fischer [mailto:rep.dot.nop at gmail.com] 
> Sent: Wednesday, August 27, 2008 11:18 AM
> To: Tim Barr
> Cc: buildroot at uclibc.org
> Subject: Re: [Buildroot] Adding new processors and boards to buildroot
> 
> 
> On Wed, Aug 27, 2008 at 11:04:36AM -0500, Tim Barr wrote:
> >We are able to compile u-boot 1.3.3 using make 3.80, is there any way
> 
> [FILE] make-3.80.tar.bz2. . . . . . . . Oct 04  2002    900K 
> [DOWNLOAD]
> [FILE] make-3.81.tar.bz2. . . . . . . . Apr 01  2006   1125K 
> [DOWNLOAD]
> 
> Why do you think you cannot use make 3.81?
> 
