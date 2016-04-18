From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:48:33 +0200
Subject: [Buildroot] [PATCH 1/1] syslinux: Allow to build multiple
 flavors simultaneously
In-Reply-To: <1458202156-25097-1-git-send-email-benoit.allard@greenbone.net>
References: <1458202156-25097-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20160418234833.5016c801@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 09:09:16 +0100, Beno?t Allard wrote:
> This becomes handy when building hybrid images that needs to be able to boot
> in MBR and GPT mode.
> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
> Changed v1 -> v2
>   - Always select at least isolinux (Suggested by Arnoud and Thomas)
>   - Update the labels to read "install xxx"
> ---
>  boot/syslinux/Config.in   | 17 +++++++++--------
>  boot/syslinux/syslinux.mk |  4 ++--
>  2 files changed, 11 insertions(+), 10 deletions(-)

I've fixed the small typo noticed by Arnout and applied, thanks! Thanks
to Matt and Arnout for testing/reviewing!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
