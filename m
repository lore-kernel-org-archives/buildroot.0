From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:28:04 +0200
Subject: [Buildroot] [PATCH 17/32] lua-periphery: add hash file
In-Reply-To: <1438023083-19010-17-git-send-email-francois.perrad@gadz.org>
References: <1438023083-19010-1-git-send-email-francois.perrad@gadz.org>
 <1438023083-19010-17-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150727222804.3db06e81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Mon, 27 Jul 2015 20:51:08 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-periphery/lua-periphery.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/lua-periphery/lua-periphery.hash
> 
> diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
> new file mode 100644
> index 0000000..84b97bd
> --- /dev/null
> +++ b/package/lua-periphery/lua-periphery.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	cb08554ed74cda2d1c939dd9320175a6cd02266a530b41287b8e7cde04a5bc48  lua-periphery-1.0.4-1.src.rock

This patch doesn't apply on the latest master: lua-periphery has been
bumped to a more recent version and a hash file has already been
created.

Please make sure that your series apply to the latest master before
sending, thanks a lot!

I've marked this one as Rejected in patchwork. I'll look at the other
patches now.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
