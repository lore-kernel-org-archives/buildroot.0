From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 19:06:15 +0100
Subject: [Buildroot] [PATCH v2 1/6] system: move init system option
 above /dev management.
In-Reply-To: <1379679847-16141-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1379679847-16141-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20131102190615.198b2138@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 20 Sep 2013 14:24:02 +0200, Eric Le Bihan wrote:
> The option to choose init system was below the one for /dev management.
> As Systemd forces the use of udev, it is logical to swap them.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  system/Config.in |   58 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
