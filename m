From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:00:39 +0100
Subject: [Buildroot] [PATCH 2/3] Config.in: add symbols for
 BR2_HOST_GCC_AT_LEAST_4_6
In-Reply-To: <1458419136-9094-2-git-send-email-bernd.kuhls@t-online.de>
References: <1458419136-9094-1-git-send-email-bernd.kuhls@t-online.de>
 <1458419136-9094-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160320150039.57b496bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 19 Mar 2016 21:25:35 +0100, Bernd Kuhls wrote:
> This option is needed to fix the Kodi build with older host gcc
> versions.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
