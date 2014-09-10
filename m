From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 22:30:33 +0200
Subject: [Buildroot] [PATCH] toolchain/musl: disable for PowerPC SPE
In-Reply-To: <1410380164-17479-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410380164-17479-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140910223033.0c360db5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 10 Sep 2014 17:16:04 -0300, Gustavo Zacarias wrote:
> It's not supported and the build breaks.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  toolchain/toolchain-buildroot/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
