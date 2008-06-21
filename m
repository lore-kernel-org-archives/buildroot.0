From: Conrad Parker <conrad@metadecks.org>
Date: Sat, 21 Jun 2008 12:46:07 +0900
Subject: [Buildroot] [PATCH] install libvorbis via staging dir
In-Reply-To: <20080620121223.GD12682@mx.loc>
References: <dba6c0830806200453n53dad842p2b5a8a81b62d2f0d@mail.gmail.com>
	<20080620121223.GD12682@mx.loc>
Message-ID: <dba6c0830806202046w4e371687odfdeb5b253de9dc6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/6/20 Bernhard Fischer <rep.dot.nop@gmail.com>:
> On Fri, Jun 20, 2008 at 08:53:43PM +0900, Conrad Parker wrote:
>>the attached patch updates package/libvorbis/libvorbis.mk to install
>>via the staging dir,
>>as is done for libogg.
>
> please resend.
>

Bernhard, thanks for the advice about correct use of $(INSTALL) etc..

A  cleaner patch is attached.

cheers,

Conrad.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Install-vorbis-libraries-via-staging-dir.patch
Type: text/x-patch
Size: 1378 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080621/5c3d229c/attachment.bin 
