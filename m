From: Rick Foos <rick@synchromeshcomputing.com>
Date: Mon, 25 Jun 2007 09:29:22 -0500
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
References: <01c301c7b519$52679b40$6e02a8c0@k2>
	<20070623093927.GG4096@aon.at><003801c7b605$0e32cb10$6604a8c0@shukson><1182776909.20950.4.camel@aeglos.sweden.atmel.com><1182777605.10703.37.camel@localhost.localdomain><20070625134008.GA7287@aon.at>
	<20070625134339.GB7287@aon.at>
Message-ID: <005101c7b735$39e95090$6604a8c0@shukson>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Mon, Jun 25, 2007 at 03:40:08PM +0200, Bernhard Fischer wrote:
>
>>me and complicates maintenance (which it doesn't from my POV), then it's
> s/and complicates/and does not complicate/g
>>fine to apply.

If this is the patch, I would add the reconfigure target to .PHONY. There 
was a related bug on defconfig involving this.

Cheers,
Rick
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-reconfigure-01.patch
Type: application/octet-stream
Size: 2280 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070625/9281d665/attachment.obj 
