From: Michael Opdenacker <michael-lists@free-electrons.com>
Date: Thu, 26 Oct 2006 19:48:58 +0200
Subject: [Buildroot] Error building arm toolchain: undefined reference
 to `raise'
Message-ID: <4540F50A.7050106@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for not replying to the original thread... I've just subscribed to 
the list.

I've just faced the same issue, in a very similar configuration.

When I use the latest uClibc snapshot, compiling stumbles on another error:

AS libc/sysdeps/linux/arm/sigrestorer.os
libc/sysdeps/linux/arm/sigrestorer.S: Assembler messages:
libc/sysdeps/linux/arm/sigrestorer.S:43: Error: invalid constant -- `mov 
r7,$((0x900000+119))'
libc/sysdeps/linux/arm/sigrestorer.S:63: Error: invalid constant -- `mov 
r7,$((0x900000+173))'
make[2]: *** [libc/sysdeps/linux/arm/sigrestorer.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory 
`/home/mike/tmp/buildroot/buildroot/toolchain_build_arm/uClibc'

Still investigating...

Cheers,

    Michael.


-- 
Michael Opdenacker, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1000 pages!)
