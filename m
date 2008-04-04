From: Ma Andrew <andrewma83@hotmail.com>
Date: Thu, 3 Apr 2008 22:36:07 -0700
Subject: [Buildroot] Error when compiling Buildroot to create
	.iso	(cannot stat /.../i386-linux-2.6.24-20
In-Reply-To: <1207284485.3964.26.camel@nigel-x60>
References: <326f33790804031358n63fd21bs5ee753b194d3a89b@mail.gmail.com>
	<BLU136-W8787D45D6697B1F3539C3C3F70@phx.gbl>
	<326f33790804031513n230462e5hb65b1705dafabace@mail.gmail.com>
	<BLU136-W3608C3619B673FB8C4FC10C3F70@phx.gbl>
	<326f33790804031646w6a11671fgba1f50aba995f450@mail.gmail.com>
	<BLU136-W408F3BBAFC783BCAF49646C3F70@phx.gbl>
	<326f33790804031722y751e20fbp90953425cc54b247@mail.gmail.com>
	<BLU136-W23D741198BD0E52C39F5A9C3F60@phx.gbl> 
	<1207284485.3964.26.camel@nigel-x60>
Message-ID: <BLU136-W53B177A876BAF0750E74CCC3F60@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Nigel,

I didn't have a chance to compile from a fresh checkout copy, and only do a "svn update" when I see your email.  The copy that I compiled is checked out from yesterday.  The revision that I am in is 21630.  I am still suffering from the same problem if the sym link is removed.

Thanks
--Andrew


----------------------------------------
> Subject: Re: [Buildroot] Error when compiling Buildroot to create .iso	(cannot stat /.../i386-linux-2.6.24-20
> From: nkukard at lbsd.net
> To: andrewma83 at hotmail.com
> CC: reddyac at gmail.com; buildroot at uclibc.org
> Date: Fri, 4 Apr 2008 04:48:05 +0000
> 
> 
>> cp /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404 /mnt/lab/buildroot/build_i686/iso9660/kernel
>> cp: cannot stat
>> `/mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404': No such
>> file or directory
>> 
>> You may want to see what
>> is /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404.  It
>> turns out to
>> be /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404
>> -> ../../x86/boot/bzImage
> 
> I submitted a patch to fix this afaik (commit r21441). Are you using
> latest svn?
> 
> -N

_________________________________________________________________
??? Windows Live Messenger ? Hotmail????????????? ? Windows Live for Mobile 
http://www.msn.com.tw/msnmobile/ 
