From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 17:20:11 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <87k5jl79ke.fsf@macbook.be.48ers.dk>
References: <20080329162316.C78283C51A@busybox.net>
	<87k5jl79ke.fsf@macbook.be.48ers.dk>
Message-ID: <1206811211.19075.5.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  nkukard> +ifeq ($(BR2_x86_pentiumpro),y)
>  nkukard> +	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
> 
> That seems wrong. Should probably be CONFIG_PENTIUMII instead.

You're right, it should be i686 though. I don't think pentium2 is the
same, p2 came after ppro didn't it?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/521aa456/attachment.pgp 
