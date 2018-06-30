From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:41:06 +0200
Subject: [Buildroot] [PATCH 1/5 v2] package/lua-flu: fix to use the
 system xattr header
In-Reply-To: <652be114258a3d7b5829303a5c9219a26bd62c08.1530368468.git.yann.morin.1998@free.fr>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <652be114258a3d7b5829303a5c9219a26bd62c08.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <20180630184106.7b57a0d4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 16:21:23 +0200, Yann E. MORIN wrote:
> We can't carry a mercurial patch, because the luarocks package is not
> organised with the same layout as the upstream package source tree is.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> 
> ---
> Changes v1 -> v2:
>   - explain ENOATTR -> ENODATA conversion  (Thomas)
>   - explain why it's not a hg patch  (Thomas)
>   - reference upstream PR and commit
> ---
>  package/lua-flu/0001-use-system-xattr-h.patch | 169 ++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 package/lua-flu/0001-use-system-xattr-h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
