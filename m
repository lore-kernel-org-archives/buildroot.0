From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 15:00:14 +0200
Subject: [Buildroot] [PATCH buildroot-test] toolchains/config: remove
 sourcery powerpc toolchains
In-Reply-To: <1461935953-6011-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461935953-6011-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160501150014.45b60d88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 10:19:13 -0300, Gustavo Zacarias wrote:
> To match their removal from main buildroot.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  web/toolchains/configs/sourcery-powerpc-e500v2.config | 3 ---
>  web/toolchains/configs/sourcery-powerpc.config        | 2 --
>  web/toolchains/configs/toolchain-configs.csv          | 2 --
>  3 files changed, 7 deletions(-)
>  delete mode 100644 web/toolchains/configs/sourcery-powerpc-e500v2.config
>  delete mode 100644 web/toolchains/configs/sourcery-powerpc.config

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
