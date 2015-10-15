From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 13:27:51 +0200
Subject: [Buildroot] [PATCH] sqlcipher: disable tcl support
In-Reply-To: <1444905771-30927-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444905771-30927-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151015132751.5af3390b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 15 Oct 2015 07:42:51 -0300, Gustavo Zacarias wrote:
> In commit b1dcb1c2 a fix was attempted at fixing a build failure where
> sqlcipher finds the distribution tcl and tries to build against it.
> sqlcipher has two tcl usage scenarios: host-tcl which is required to
> actually build it, and target tcl to build bindings.
> Since cross-compilation of the bindings isn't clean it fails as well,
> and since it wasn't a feature before either just disable it completely,
> since the wrong fix makes the sqlcipher build failures worse.
> Fixes:
> http://autobuild.buildroot.net/results/fc0/fc0528de7fed2f34f503fe8dd8b4c21ded0d6dff/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sqlcipher/sqlcipher.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
