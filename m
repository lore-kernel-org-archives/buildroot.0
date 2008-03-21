From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 21 Mar 2008 08:38:47 +0000
Subject: [Buildroot] avr32 patches vs. x86 breakage
In-Reply-To: <873aqk32yb.fsf@macbook.be.48ers.dk>
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk>
	<1206086506.2562.64.camel@nigel-x60>
	<873aqk32yb.fsf@macbook.be.48ers.dk>
Message-ID: <1206088727.2562.72.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>  >> - package-version-*.patch for generic stuff
>  >> - arch-package-version-*.patch for arch specific stuff
>  >> 
>  >> What do you think?
> 
>  Nigel> What about patch order? and patch order when there is generic stuff and
>  Nigel> arch specific?
> 
> My (possibly too simplistic) view on things is to first apply the
> generic patches, and then the arch specific ones.

yea, generic first I think aswell.

few more thoughts...

these would be in for instance  toolchain/gcc/



1.
version/*.patch  - generic
version/arch/*.patch  -  arch specific


2.
version/*.patch
arch-version/*.patch


3.
version-*.patch
arch-version-*.patch


-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080321/9ad75c06/attachment.pgp 
