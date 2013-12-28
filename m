From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 16:11:34 +0100
Subject: [Buildroot] [PATCH 1/2] support/kconfig: Update kconfig to
 3.13-rc5
In-Reply-To: <1388179109-23491-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1388179109-23491-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1388179109-23491-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20131228161134.18c1da1e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Fri, 27 Dec 2013 22:18:28 +0100, Maxime Hadjinlian wrote:
> Only minor changes are registered, mainly help text.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  support/kconfig/README.buildroot |  2 +-
>  support/kconfig/expr.h           |  2 +-
>  support/kconfig/mconf.c          | 60 +++++++++++++++++++---------------------
>  support/kconfig/menu.c           | 11 ++++----
>  support/kconfig/qconf.cc         |  5 ++++
>  support/kconfig/qconf.h          |  1 +
>  support/kconfig/symbol.c         |  2 +-
>  support/kconfig/zconf.l          |  1 -
>  8 files changed, 44 insertions(+), 40 deletions(-)

Thanks, both patches 1/2 and 2/2 applied. I've ignored the two patches
you had sent which had both changes combined into one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
