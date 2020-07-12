From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 11:21:51 +0200
Subject: [Buildroot] [PATCH v3 2/7] support/dependencies: check that
 host have gcc plugin headers
In-Reply-To: <20200706153040.427457-3-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
 <20200706153040.427457-3-kamel.bouhara@bootlin.com>
Message-ID: <20200712112151.7bbf3293@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kamel,

On Mon,  6 Jul 2020 17:30:35 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> Some packages requires host gcc headers to build gcc plugins. This
> checks they are indeed installed.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> Config.in: add BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
> 
> In preparation to the addition of new dependencies in the odb package,
> add the BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT symbol.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

You have squashed commits, but you did not even fix the commit log :-/

I fixed the commit log, did a few minor tweaks, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
