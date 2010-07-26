From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Mon, 26 Jul 2010 14:32:45 +0100
Subject: [Buildroot] makedevs: line 49: regular file (...)
 buildroot/output/target/usr/share/udhcpc/default.script does not exist: No
 such file or directory
In-Reply-To: <20100726082816.7a1bd8d1@surf>
References: <1280116089.28885.29.camel@segulix> <20100726082816.7a1bd8d1@surf>
Message-ID: <1280151165.31502.6.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2010-07-26 at 08:28 +0200, Thomas Petazzoni wrote: 
> Hello,
> 
> On Mon, 26 Jul 2010 04:48:09 +0100
> Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> wrote:
> 
> > I got this error too , with buildroot-2010.05.
> 
> Which error ?

Well error is in subject (Can't get Buildrooot to finish):

makedevs: line 49: regular file (...)
buildroot/output/target/usr/share/udhcpc/default.script does not exist:
No such file or directory

> 
> > After read some threads in this mailing list is this some error , 
> > to work around I done:
> > cd output/target/usr/share
> > ln -s ../../../../target/generic/target_skeleton/usr/share/udhcpc
> > 
> > and build rootfs , is this correct ? the target is a mips32r2 . 
> 
> Maybe, but as you haven't copy/pasted the error, it's hard to say :-)
> 
> Regards,
> 
> Thomas

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3293 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100726/29584fb9/attachment.bin>
