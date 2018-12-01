From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 1 Dec 2018 08:59:36 -0200 (BRST)
Subject: [Buildroot] [PATCHv4] fs: allow filesystems to set the name of
 their output file
In-Reply-To: <20181201091436.7896-1-yann.morin.1998@free.fr>
References: <20181201091436.7896-1-yann.morin.1998@free.fr>
Message-ID: <1050370352.626793.1543661976775.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "DATACOM" <casantos@datacom.com.br>, "Yann Morin" <yann.morin.1998@free.fr>
> Sent: S?bado, 1 de dezembro de 2018 7:14:36
> Subject: [PATCHv4] fs: allow filesystems to set the name of their output file

> From: Carlos Santos <casantos@datacom.com.br>
> 
> Some filesystems may want to tweak their output names, rather than using
> the fixed "rootfs.foo" scheme. Add a ROOTFS_FOO_IMAGE_NAME variable for
> this purpose.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> [yann.morin.1998 at free.fr: fix the patch]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v3 -> v4 (Yann):
>  - fix use of $(strip)

Thanks!

-- 
Carlos Santos (Casantos) - DATACOM, P&D
