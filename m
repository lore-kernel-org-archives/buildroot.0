From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Thu, 31 May 2007 19:54:08 +0100
Subject: [Buildroot] Ogg and Vorbis patch part 2
In-Reply-To: <20070529202507.GC30684@aon.at>
References: <465AD791.2040108@teamboyce.co.uk> <20070529202507.GC30684@aon.at>
Message-ID: <465F19D0.6020001@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> just
> 	-$(MAKE) -C $(LIBOGG_WORKDIR) clean
> and drop the if.
> [snip]
>
>   

All,

Attached is a new improved patch to add libvorbis and libogg to build 
root.  I have only tested on 386 hopefully others can test on other 
platforms.  I have a floating point unit so I do not need to use an 
integer only version.

Regards,
Rod Boyce

-------------- next part --------------
A non-text attachment was scrubbed...
Name: libogg-libvorbis.patch
Type: text/x-patch
Size: 13686 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070531/87718c09/attachment-0001.bin 
