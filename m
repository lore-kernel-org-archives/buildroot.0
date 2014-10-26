From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 14:14:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: Fix uClibc build
 with BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413741922-30234-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413741922-30234-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026141408.3ff98c48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 20:05:22 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: reworked patch to include a configure check (Thomas)
> 
>  package/mesa3d/mesa3d-0002-execinfo_h.patch |   47 +++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/mesa3d/mesa3d-0002-execinfo_h.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
