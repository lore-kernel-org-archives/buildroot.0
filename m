From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:08:56 +0200
Subject: [Buildroot] [PATCH v3] libbsd: Enable the ARM architecture
In-Reply-To: <1412538472-5067-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1412538472-5067-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141005230856.5054a75d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  5 Oct 2014 21:47:52 +0200, Maxime Hadjinlian wrote:
> Rework the architecture support.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v2 -> v3:
>     - Change title of the commit
>     - Add LIBBSD_ARCH_SUPPORT variable
>     - Modify comment
> v1 -> v2:
>     - Remove m68k as it is currently marked broken in BR
> ---
>  package/libbsd/Config.in | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Thanks, applied, after some minor rewording of the commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
