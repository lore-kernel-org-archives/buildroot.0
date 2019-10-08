From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:23:06 +0200
Subject: [Buildroot] [PATCH] core/pkg-meson: simplify sed-expression to
 add to [binaries]
In-Reply-To: <20191006151021.9127-1-yann.morin.1998@free.fr>
References: <20191006151021.9127-1-yann.morin.1998@free.fr>
Message-ID: <20191008232306.1a44536c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 17:10:21 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> There is no need to memorise the matched pattern; it's a left-over from
> a previous attempt.
> 
> However, ensure the pattern is correctly anchored to the beginning and
> end of the line, to avoid accidentally matching it anywhere else (e,g,
> in a comment).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
