From: David Lambert <dave@lambsys.com>
Date: Wed, 18 Oct 2006 07:12:17 -0500
Subject: [Buildroot] libgcc_s.so.1 missing from filesystem
In-Reply-To: <20061017190319.GA19820@codepoet.org>
References: <452CE9EC.4050101@lambsys.com>
	<20061017190319.GA19820@codepoet.org>
Message-ID: <45361A21.4060901@lambsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erik Andersen wrote:
> Could I have a copy of your buildroot .config file?  I've tested
> both with and without BR2_GCC_SHARED_LIBGCC set and both settings
> produced working root filesystems for me....
> 
Erik,
	I removed my manual copy and it now works! The only change is that I 
have since run svn update (to revision 16401). Unfortunately I do not 
remember the revision where the problem occurred. In any case I am 
including my .config file as you requested.

Best regards,

Dave.


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
Url: http://busybox.net/lists/buildroot/attachments/20061018/01912809/attachment.asc 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dave.vcf
Type: text/x-vcard
Size: 288 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061018/01912809/attachment-0001.vcf 
