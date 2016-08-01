From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:09:42 +0200
Subject: [Buildroot] [PATCH 1/3] package/xenomai: introduce a
 BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS option
In-Reply-To: <1470069021-24233-1-git-send-email-romain.naour@gmail.com>
References: <1470069021-24233-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160801220942.1a0dc484@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 18:30:19 +0200, Romain Naour wrote:
> Introduce BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS to hold the
> architectures than can build and use Xenomai on the target.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/xenomai/Config.in | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
