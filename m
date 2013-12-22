From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:24:51 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 03/10] lua: remove a too
 invasive patch
In-Reply-To: <1384520859-3189-3-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222182451.34bdf2c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 15 Nov 2013 14:07:32 +0100, Francois Perrad wrote:
> the static version of luac is enough
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua/lua-03-shared-libs-for-luac.patch |   97 -------------------------
>  1 file changed, 97 deletions(-)
>  delete mode 100644 package/lua/lua-03-shared-libs-for-luac.patch

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter, can you apply this patch right now? It is independent from the
rest of the series, and would allow to reduce the size of the series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
