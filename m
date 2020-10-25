From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 16:05:58 +0100
Subject: [Buildroot] [PATCH v1] package/meson: fix
 cross-compilation.conf.in formatting
In-Reply-To: <20201024183810.28154-1-ps.report@gmx.net>
References: <20201024183810.28154-1-ps.report@gmx.net>
Message-ID: <20201025160558.1b6b7985@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 24 Oct 2020 20:38:10 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add missing space for the cross-compilation.conf.in cpu_family
> entry.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/meson/cross-compilation.conf.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
