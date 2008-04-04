From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 04 Apr 2008 04:48:05 +0000
Subject: [Buildroot] Error when compiling Buildroot to create
	.iso	(cannot stat /.../i386-linux-2.6.24-20
In-Reply-To: <BLU136-W23D741198BD0E52C39F5A9C3F60@phx.gbl>
References: <326f33790804031358n63fd21bs5ee753b194d3a89b@mail.gmail.com>
	<BLU136-W8787D45D6697B1F3539C3C3F70@phx.gbl>
	<326f33790804031513n230462e5hb65b1705dafabace@mail.gmail.com>
	<BLU136-W3608C3619B673FB8C4FC10C3F70@phx.gbl>
	<326f33790804031646w6a11671fgba1f50aba995f450@mail.gmail.com>
	<BLU136-W408F3BBAFC783BCAF49646C3F70@phx.gbl>
	<326f33790804031722y751e20fbp90953425cc54b247@mail.gmail.com>
	<BLU136-W23D741198BD0E52C39F5A9C3F60@phx.gbl>
Message-ID: <1207284485.3964.26.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> cp /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404 /mnt/lab/buildroot/build_i686/iso9660/kernel
> cp: cannot stat
> `/mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404': No such
> file or directory
> 
> You may want to see what
> is /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404.  It
> turns out to
> be /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404
> -> ../../x86/boot/bzImage

I submitted a patch to fix this afaik (commit r21441). Are you using
latest svn?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080404/fac2aac9/attachment.pgp 
