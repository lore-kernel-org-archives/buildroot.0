From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 17:13:58 +0200
Subject: [Buildroot] [PATCH] pckage/upmpdcli: disable for powerpc CS
 toolchains
In-Reply-To: <1405780833-10266-1-git-send-email-yann.morin.1998@free.fr>
References: <1405780833-10266-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140719171358.52359c2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 19 Jul 2014 16:40:33 +0200, Yann E. MORIN wrote:
> Those toolchains use gcc <= 4.5, which is too old as they are missing
> range-based for-loops, only introduced with gcc-4.6.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/f00/f00fa9b83718abaffd1f52dcd50e582434b3c5e2/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Ezequiel Garcia <elezegarcia@gmail.com>
> ---
>  package/upmpdcli/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
