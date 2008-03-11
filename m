From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 11 Mar 2008 15:54:25 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <20080311154910.4CAEC120137@busybox.net>
References: <20080311154910.4CAEC120137@busybox.net>
Message-ID: <1205250865.10692.235.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Author: ninevoltz
> Date: 2008-03-11 08:49:09 -0700 (Tue, 11 Mar 2008)
> New Revision: 21293
> 
> Log:
> fixed path problem
> 
> Modified:
>    trunk/buildroot/toolchain/binutils/binutils.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/toolchain/binutils/binutils.mk
> ===================================================================

I added /gnu/  because most of the other packages have it.

grep -r '$(BR2_GNU_MIRROR)/gnu' buildroot/

The path will be invalid if you remove it?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080311/c107deef/attachment.pgp 
