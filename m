From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 11 Mar 2008 08:38:28 +0000
Subject: [Buildroot] $(ARCH) not set & mirrors
In-Reply-To: <871w6hznbg.fsf@macbook.be.48ers.dk>
References: <1205178237.10692.178.camel@nigel-x60>
	<878x0q2uyr.fsf@macbook.be.48ers.dk>
	<1205216387.10692.185.camel@nigel-x60>
	<871w6hznbg.fsf@macbook.be.48ers.dk>
Message-ID: <1205224708.10692.195.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  Nigel> <snip>
>  Nigel> 2. I've found quite a number of make files which don't use the
>  Nigel> mirror's defined in menu config to retrieve the sources
>  Nigel> ... can I submit patches to fix this or is it intentional?
>  >> 
>  >> Sounds like a bug. Please submit.
> 
>  Nigel> Please find attached.
> 
> Thanks. Committed except for the hunk changing the fakeroot
> version. Please don't mix multiple changes in the same patch.

Blast ... sorry. I'll be more careful.

Patch attached for fixing of ARCH not being defined when selecting some
x86 target arch variants.

-N


-------------- next part --------------
A non-text attachment was scrubbed...
Name: arch-fixes.patch
Type: text/x-patch
Size: 691 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080311/bb0f65d8/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080311/bb0f65d8/attachment.pgp 
