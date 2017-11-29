From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:45:36 +0100
Subject: [Buildroot] [PATCH] package/lttng-tools: fix typo in variable
 name
In-Reply-To: <20171129221710.19089-1-yann.morin.1998@free.fr>
References: <20171129221710.19089-1-yann.morin.1998@free.fr>
Message-ID: <20171129234536.60388764@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 23:17:10 +0100, Yann E. MORIN wrote:
> It's lttng-tools, not lttng-libust. ;-)
> 
> Fixes numerous build failures caused by a late autoreconf:
>     http://autobuild.buildroot.org/results/b84/b84a6e39fcca70c56bfe49d54c385dfe6da82422/
>     etc...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
>  package/lttng-tools/lttng-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
