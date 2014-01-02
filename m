From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 10:02:31 +0100
Subject: [Buildroot] [PATCH] manual: fix uboot subdirectory in example
 layout
In-Reply-To: <1388574191-6280-1-git-send-email-spdawson@gmail.com>
References: <1388574191-6280-1-git-send-email-spdawson@gmail.com>
Message-ID: <20140102100231.71a6b02b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear spdawson at gmail.com,

On Wed,  1 Jan 2014 11:03:11 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> If U-Boot patches are nested under BR2_GLOBAL_PATCH_DIR, then the
> subdirectory should be called "uboot", and not "u-boot".
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  docs/manual/customize-packages.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
