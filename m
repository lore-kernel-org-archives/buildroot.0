From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 23:50:30 +0100
Subject: [Buildroot] [PATCH] luarocks: remove luainterpreter dependency
In-Reply-To: <1393713055-15107-1-git-send-email-francois.perrad@gadz.org>
References: <1393713055-15107-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140301235030.4b2db15e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  1 Mar 2014 23:30:55 +0100, Francois Perrad wrote:
> a package using luarocks infrastructure needs a dependency with luainterpreter.
> this is already done in pkg-luarocks.mk.
> 
> here, in luarocks.mk, this dependency causes an issue with 'make legal-info' :
> luainterpreter and an toolchain are built.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/luarocks.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, after adding a lot more details in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
