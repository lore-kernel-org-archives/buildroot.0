From: anthony henderson <development@fair-games.com>
Date: Mon, 4 Oct 2010 14:26:53 +0100
Subject: [Buildroot] can't resolve symbol 'atexit'
Message-ID: <AANLkTinDdVF2W2sgU24qBHfDVztgJ-kEy=FQyeuE7fyH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all
I've got busy box working well with my software, however I've tried to run
an exe provided by the board vendor and get the following error "can't
resolve symbol 'atexit'" is there a way to fix this?  It's a bit hard to
find details on google, I think it's to do with different versions of
uClibc?  However when I've opened buildroot and looked in toolchain ->
uClibc I can't see any options to do with atexit.  Can anyone point me in
the right direction, thanks.

-- 
Regards Tony


NOTE: This message is intended solely for the use of the individual or
organization to whom it is addressed. It may contain privileged or
confidential information. If you have received this message in error, please
notify the originator immediately. If you are not the intended recipient,
you should not use, copy, alter, or disclose the contents of this message.
All information or opinions expressed in this message and/or any attachments
are those of the author and are not necessarily those of Fair Games UK LTD
or its affiliates. Fair Games UK LTD accepts no responsibility for loss or
damage arising from its use, including damage from virus.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101004/cce77f81/attachment.html>
