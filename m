From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:17:43 +0200
Subject: [Buildroot] [PATCH 1/6] arch: remove support for sh64
In-Reply-To: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473359942-15810-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160908221743.6f3ab80d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 15:38:57 -0300, Gustavo Zacarias wrote:
> It's been deprecated for quite some time now.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .defconfig                              |  1 -
>  arch/Config.in                          | 12 +-----------
>  arch/Config.in.sh                       |  3 +--
>  linux/Config.in                         |  6 +++---
>  package/fdk-aac/Config.in               |  4 ++--
>  package/gauche/Config.in                |  2 +-
>  package/gdb/Config.in                   |  4 ++--
>  package/libunwind/Config.in             |  2 +-
>  package/ruby/ruby.mk                    |  2 +-
>  toolchain/toolchain-buildroot/Config.in |  4 ++--
>  10 files changed, 14 insertions(+), 26 deletions(-)

I've applied patches 1, 2, 3, 4 and 6. I've left PATCH 5/6 on the side
for now, I'll reply to it to explain why.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
