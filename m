From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 14:20:30 +0100
Subject: [Buildroot] [PATCH 1/1] network-manager: add hash file
In-Reply-To: <1425911414-31038-1-git-send-email-petr.vorel@gmail.com>
References: <1425911414-31038-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150316142030.5a3109cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Mon,  9 Mar 2015 15:30:14 +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/network-manager/network-manager.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/network-manager/network-manager.hash
> 
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> new file mode 100644
> index 0000000..07513a9
> --- /dev/null
> +++ b/package/network-manager/network-manager.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:

I've changed this to
http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.0.sha256sum,
as noted by Baruch, and committed. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
