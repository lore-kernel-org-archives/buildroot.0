From: Fredrik Roubert <roubert@df.lth.se>
Date: Tue, 10 Oct 2006 13:16:50 +0200
Subject: [Buildroot] ld.real: cannot find -lgcc_s
In-Reply-To: <901e5e350610100356t2524befep22a71d924c4961ce@mail.gmail.com>
References: <901e5e350610100356t2524befep22a71d924c4961ce@mail.gmail.com>
Message-ID: <20061010111650.GH27810@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue 10 Oct 12:56 CEST 2006, Michael wrote:

> How do I need to do to resolve the "cannot find -lgcc_s" problem?

One possible solution is to unset BR2_GCC_SHARED_LIBGCC in the buildroot
configuration, to get rid of the shared libgcc alltogether.

Cheers // Fredrik Roubert

-- 
Visserij 192  |  +32 473 344527 / +46 708 776974
BE-9000 Gent  |  http://www.df.lth.se/~roubert/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 303 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061010/ba122567/attachment.pgp 
