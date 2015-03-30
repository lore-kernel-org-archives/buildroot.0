From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:35:03 +0200
Subject: [Buildroot] [PATCH 1/1] mongoose: add hash file
In-Reply-To: <1427750440-5020-1-git-send-email-zinosat@tiscali.it>
References: <1427750440-5020-1-git-send-email-zinosat@tiscali.it>
Message-ID: <20150330233503.600da0bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Mon, 30 Mar 2015 23:20:40 +0200, Davide Viti wrote:
> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
>  package/mongoose/mongoose.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/mongoose/mongoose.hash
> 
> diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
> new file mode 100644
> index 0000000..b7e758c
> --- /dev/null
> +++ b/package/mongoose/mongoose.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +cc2557c7cf9f15e1e691f285a4c6c705cc7e56cb70c64cb49703a428a0677065  mongoose-5.6.tar.gz

Are you sure you tested this? This hash file doesn't have the right
format, it should specify which hash is used as the first field.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
