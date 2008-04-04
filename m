From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 04 Apr 2008 06:26:37 +0000
Subject: [Buildroot] Error when compiling Buildroot to create
	.iso	(cannot stat /.../i386-linux-2.6.24-20
In-Reply-To: <BLU136-W53B177A876BAF0750E74CCC3F60@phx.gbl>
References: <326f33790804031358n63fd21bs5ee753b194d3a89b@mail.gmail.com>
	<BLU136-W8787D45D6697B1F3539C3C3F70@phx.gbl>
	<326f33790804031513n230462e5hb65b1705dafabace@mail.gmail.com>
	<BLU136-W3608C3619B673FB8C4FC10C3F70@phx.gbl>
	<326f33790804031646w6a11671fgba1f50aba995f450@mail.gmail.com>
	<BLU136-W408F3BBAFC783BCAF49646C3F70@phx.gbl>
	<326f33790804031722y751e20fbp90953425cc54b247@mail.gmail.com>
	<BLU136-W23D741198BD0E52C39F5A9C3F60@phx.gbl>
	<1207284485.3964.26.camel@nigel-x60>
	<BLU136-W53B177A876BAF0750E74CCC3F60@phx.gbl>
Message-ID: <1207290397.2660.1.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 2008-04-03 at 22:36 -0700, Ma Andrew wrote:
> Hello Nigel,
> 
> I didn't have a chance to compile from a fresh checkout copy, and only do a "svn update" when I see your email.  The copy that I compiled is checked out from yesterday.  The revision that I am in is 21630.  I am still suffering from the same problem if the sym link is removed.

Nuke all the files in the destination dir, if the symlink is there its
not going to copy over the dereferenced file in any case.

So nuke all the files, and rebuild.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080404/51726774/attachment.pgp 
