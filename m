From: Thomas Huth <huth@tuxfamily.org>
Date: Tue, 28 May 2019 08:41:15 +0200
Subject: [Buildroot] [PATCH 1/1] boot/barebox: add hash for the license
 file
In-Reply-To: <20190527153054.12381-1-b.bilas@grinn-global.com>
References: <20190527153054.12381-1-b.bilas@grinn-global.com>
Message-ID: <20190528084115.77e880c5@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 27 May 2019 17:30:54 +0200
schrieb Bartosz Bilas <b.bilas@grinn-global.com>:

> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  boot/barebox/barebox.hash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
> index fb371ab671..aa9038b9d4 100644
> --- a/boot/barebox/barebox.hash
> +++ b/boot/barebox/barebox.hash
> @@ -3,3 +3,4 @@ md5 2e721cce90f1ea1492710ca23680311f
> barebox-2019.05.0.tar.bz2 
>  # Locally calculated
>  sha256
> 704bb09b2bf1347e43ebb9138da32a7e1b4d13892fd187be98f4f9dae000501d
> barebox-2019.05.0.tar.bz2 +sha256
> ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4
> COPYING

The COPYING file is only a short description which refers to
LICENSES/preferred/GPL-2.0 ... so I think you should provide a hash
for that file, too?

 Thomas
