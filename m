From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 19 Jun 2016 16:32:20 +0200
Subject: [Buildroot] [PATCH 024/121] package/linux-headers: add hash file
In-Reply-To: <0c039620c4db52e3f0b2223e7b2a2b7a806b0018.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <0c039620c4db52e3f0b2223e7b2a2b7a806b0018.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <3d0fed4d-b81a-4fa8-ebdd-69208e29caef@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

I don't think we want a hash file for linux-headers.

Best regards,
Romain

Le 19/06/2016 ? 13:09, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/linux-headers/linux-headers.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/linux-headers/linux-headers.hash
> 
> diff --git a/package/linux-headers/linux-headers.hash b/package/linux-headers/linux-headers.hash
> new file mode 100644
> index 0000000..2b9d183
> --- /dev/null
> +++ b/package/linux-headers/linux-headers.hash
> @@ -0,0 +1,2 @@
> +# localy computed
> +sha256  e158f3c69da87c2ec28d0f194dbe18b05e0d0b9e1142566615cea3390bab1c6a  linux-4.6.2.tar.xz
> 
