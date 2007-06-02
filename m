From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sat, 02 Jun 2007 14:02:48 +0100
Subject: [Buildroot] Update to mpg123
Message-ID: <46616A78.7000804@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Attached is an update to mpg123 this brings the build-root package up to 
the latest version of mpg123 version 0.65 I have only tested this with 
my 386 target others will have to test as well.  I have also attach a 
patch that conditionally uses ALSA when it is added to build-root and a 
patch that does not use ALSA.

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpg123-0.65_alsa.patch
Type: text/x-patch
Size: 2696 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070602/9ebae922/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mpg123-0.65_noalsa.patch
Type: text/x-patch
Size: 2545 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070602/9ebae922/attachment-0001.bin 
