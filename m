From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Nov 2019 11:41:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix NPTL dependency
In-Reply-To: <20191101055320.16078-1-heiko.thiery@gmail.com>
References: <20191101055320.16078-1-heiko.thiery@gmail.com>
Message-ID: <20191101114121.7fcee7a4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 Nov 2019 06:53:20 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> Dependency is BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of
> !BR2_TOOLCHAIN_HAS_NPTL.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  package/sysrepo/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. I should have spotted that when reviewing :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
