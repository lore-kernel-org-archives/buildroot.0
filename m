From: Thomas Lundquist <lists@zelow.no>
Date: Tue, 3 Oct 2006 19:30:02 +0200
Subject: [Buildroot] LZMA in Buldroot.
Message-ID: <20061003173002.GA19937@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks.


Since I have patches for lzma compressed initrds (ext2 root filesystem)
I added BR2_PACKAGE_LZMA_HOST and moved the package/lzma/ to
toolchain/lzma and made it just as sstrip.  (and tmake, which I've also
added).

about initrd kernel patches; I've attached one for 2.6.15.4 but if there
are interest I'll maintain patches for newer versions aswell.

I also have patches for lzma compressed kernel but only for i386 (I need it
for ARM but have met some challenges.).

Thanks to Ming-Ching Tiew for making the kernel patches.


Thomas.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: lzma-buildroot.diff.gz
Type: application/octet-stream
Size: 2439 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061003/0f04042b/attachment.obj 
