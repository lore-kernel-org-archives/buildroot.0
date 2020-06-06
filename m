From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:59:41 +0200
Subject: [Buildroot] [PATCH v3 1/9] package/luainterpreter: add abi
 version options
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200606235941.0ad065d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Could you give some feedback on this patch series, which is touching
the Lua integration in Buildroot ?

See the full series at https://patchwork.ozlabs.org/project/buildroot/list/?series=178989

Thanks a lot!

Thomas

On Sun, 24 May 2020 18:48:37 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Since a number of packages depend on specific ABI version that are
> provided by lua and luajit packages we should have a kconfig variable
> that those packages can depend on.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/lua/Config.in            | 2 ++
>  package/luainterpreter/Config.in | 6 ++++++
>  package/luajit/Config.in         | 1 +
>  3 files changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
