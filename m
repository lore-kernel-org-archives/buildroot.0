From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Mon, 28 May 2007 14:22:25 +0100
Subject: [Buildroot] Ogg and Vorbis patch
Message-ID: <465AD791.2040108@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

So attached is my libogg and libvorbis patch.  I have had a lot of 
trouble with the libvorbis code and I have included a patch to the 
install script to solve the problem of locating the library under 
/usr/lib or /usr/loca/lib also when compiling libvorbisfile I had lots 
of problems figuring out exactly the right combination of configure 
parameters and changes for library paths when compiling.  I believe I 
have got it correct now I am not a configure expert so I might have 
missed something obvious and I'll always ope to suggestions so here is 
the patch hopefully for inclusion into the build-root system.

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ogg-vorbis.patch
Type: text/x-patch
Size: 9401 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070528/ed6dedb1/attachment.bin 
