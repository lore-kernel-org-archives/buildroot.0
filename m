From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 17 Apr 2008 13:48:03 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/sfdisk
In-Reply-To: <20080417133534.GA32044@real.realitydiluted.com>
References: <20080417132321.210B43C4FC@busybox.net>
	<20080417133534.GA32044@real.realitydiluted.com>
Message-ID: <1208440083.17959.98.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<snip>
> >    trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch
> > 
> Please revert the index/rindex patch. You should be patching the code to
> NOT use those functions, not define them again. Remove the usage of them
> and then submit a patch to the upstream maintainer of sfdisk.

done
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080417/e18941c0/attachment.pgp 
