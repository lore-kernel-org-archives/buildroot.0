From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 00:01:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/elixir: fix host-erlang
 dependency
In-Reply-To: <20200820103034.11094-1-frank.vanbever@essensium.com>
References: <20200820103034.11094-1-frank.vanbever@essensium.com>
Message-ID: <20200821000136.7e56c3d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Aug 2020 12:30:34 +0200
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> Make it explicit that host-elixir depends on host-erlang. This fixes the
> build in cases where BR2_PER_PACKAGE_DIRECTORIES is set.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/a3a37eb724ca5689f8e83c9b2af04d07afa80315/
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
>  package/elixir/elixir.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
