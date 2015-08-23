From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 16:53:17 +0200
Subject: [Buildroot] Add cpio package to make rpm work
In-Reply-To: <55D71656.7040704@gmx.de>
References: <55D71656.7040704@gmx.de>
Message-ID: <20150823165317.6db43fff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Fri, 21 Aug 2015 14:15:18 +0200, universe II wrote:
> Dear all,
> I configured buildroot to add the rpm package to my target system, but I 
> ran into a problem when executing rpm on the target system. Reason is, 
> that a lot of rpms a packaged using the binary format of cpio. But the 
> busybox builtin cpio only supports "newc" and "crc" format. Therefore 
> the cpio package is necessary when rpm should be able to handle rpms in 
> binary format. The following patch add the cpio package to buildroot.
> 
> Regards,
> Andreas

As indicated by Vicente, we already have a cpio package in Buildroot.
So I've marked your patch as Rejected in our patch tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
