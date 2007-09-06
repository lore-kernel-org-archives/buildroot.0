From: Crane, Matthew <mcrane03@harris.com>
Date: Thu, 6 Sep 2007 13:51:33 -0400
Subject: [Buildroot] elf2flt integration
Message-ID: <E496871456016F4CA8959BE4105D2A890E8C98@troe2k1.cs.myharris.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

I would like to be able to use -elf2flt, so that busybox can be built
from buildroot as a flat binary. 

The elf2flt goes to staging_dir/bin
The toolchain goes to staging_dir/usr/bin and usr/<target>/bin
The toolchain gcc does not use the elf2flt flag, it instead thinks it is
a flag for the entry symbol.

How can I locate and sym link the elf2flt tools and ld.real script
installed to staging_dir/bin to the toolchain so that busybox and others
can build as a FLT binary?   Does elf2flt in buildroot work to generate
flat binaries the way it is setup now?  Assuming the linker flags are
passed properly.

Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070906/2ecb5b22/attachment.htm 
