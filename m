From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 16:32:21 +0000
Subject: [Buildroot] initramfs doesn't need root to create an image
In-Reply-To: <87wsnl7bk0.fsf@macbook.be.48ers.dk>
References: <1206773941.3224.126.camel@nigel-x60>
	<20080329140004.GA25949@cloud.net.au>
	<1206799922.3224.157.camel@nigel-x60>
	<87myoh8us4.fsf@macbook.be.48ers.dk>
	<1206802610.3224.180.camel@nigel-x60>
	<87wsnl7bk0.fsf@macbook.be.48ers.dk>
Message-ID: <1206808341.19075.1.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  Nigel> Does fakeroot keep device-special information if you create
>  Nigel> devices inside its environment? ie. if you create a /dev/hda
>  Nigel> inside a fakeroot using mknod, tar it up, exit fakeroot, untar
>  Nigel> it with admin privs, is it still a device special file?
> 
> Yes, that's the point of fakeroot.

A day doesn't pass when I don't learn something new  ;)

*thinks of ways to use fakeroot*

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/5a3932d0/attachment.pgp 
