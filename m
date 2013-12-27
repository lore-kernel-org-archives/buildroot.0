From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 19:57:31 +0100
Subject: [Buildroot] [PATCH] package: deprecate some more development
 tools
In-Reply-To: <1388145020-2082-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388145020-2082-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131227195731.33306262@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Fri, 27 Dec 2013 12:50:20 +0100, Thomas Petazzoni wrote:
> Since some time, we have removed the support to build a toolchain for
> the target, and therefore the support for several development tools on
> the target.
> 
> This commit deprecates a few additional development tools: m4, bison,
> flex and gob2. For flex, we retain the ability to build libfl, we only
> deprecated the ability to build the flex binary itself.
> 
> The original motivation for this patch is that m4 is causing build
> issues in some configurations, but there isn't really much incentive
> to fix this package for the target, since it is not really useful for
> embedded Linux systems.
> 
> Bison, Flex and Gob2 are deprecated because they are reverse
> dependencies of m4.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/bison/Config.in | 2 ++
>  package/flex/Config.in  | 2 ++
>  package/gob2/Config.in  | 2 ++
>  package/m4/Config.in    | 2 ++
>  4 files changed, 8 insertions(+)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
