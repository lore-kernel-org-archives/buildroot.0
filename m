From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 14:32:55 +0200
Subject: [Buildroot] [PATCHv2 1/2] glibc: drop redundant arch depends
In-Reply-To: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140601143255.1a6c0f02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  1 Jun 2014 08:58:38 -0300, Gustavo Zacarias wrote:
> These are already in toolchain/toolchain-buildroot/Config.in and since
> package/glibc/Config.in is filtered by BR2_TOOLCHAIN_USES_GLIBC there's
> no need to duplicate this.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glibc/Config.in | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
