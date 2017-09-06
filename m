From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:30:38 +0200
Subject: [Buildroot] [PATCH 06/12] luaposix: fix LICENSE_FILES
In-Reply-To: <20170904175046.21530-6-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
 <20170904175046.21530-6-francois.perrad@gadz.org>
Message-ID: <20170906223038.41aaf78a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 19:50:40 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luaposix/luaposix.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> index a24323fd1..98dd8d658 100644
> --- a/package/luaposix/luaposix.mk
> +++ b/package/luaposix/luaposix.mk
> @@ -7,7 +7,7 @@
>  LUAPOSIX_VERSION = 34.0.1

We don't have this version of luaposix in Buildroot. Therefore this
patch doesn't apply, and in fact isn't correct since the license file
is still named COPYING in the current version of luaposix in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
