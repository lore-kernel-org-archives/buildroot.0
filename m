From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:20:46 +0100
Subject: [Buildroot] [PATCH 31/33] owl-linux: add license info
In-Reply-To: <1353543503-8952-32-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-32-git-send-email-s.martin49@gmail.com>
Message-ID: <50B12C1E.6070100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/owl-linux/owl-linux.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
> index 0a111c8..e5846a4 100644
> --- a/package/owl-linux/owl-linux.mk
> +++ b/package/owl-linux/owl-linux.mk
> @@ -5,6 +5,8 @@
>   #############################################################
>   OWL_LINUX_VERSION = 1.0.7
>   OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
> +OWL_LINUX_LICENSE = as-is
> +OWL_LINUX_LICENSE_FILES = LICENSE

  The way I read this license, it's PROPRIETARY.  The 'as-is' is just a
warranty disclaimer.  The only reference to copyright is "All rights
reserved" - i.e., you're not allowed to copy it (or even compile it).

  This means you should also set OWL_LINUX_REDISTRIBUTE = NO.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
