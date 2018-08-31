From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 31 Aug 2018 12:15:29 +0200
Subject: [Buildroot] [PATCH] minicom: add COPYING sha256 to hash
In-Reply-To: <20180831093401.73327-1-giulio.benetti@micronovasrl.com>
References: <20180831093401.73327-1-giulio.benetti@micronovasrl.com>
Message-ID: <fcaf8d14-66f7-84db-014d-a128eca4233c@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 31/08/2018 11:34, Giulio Benetti ha scritto:
> In minicom package hash file lacks sha256 entry for COPYING file even if
> it is added to MINICOM_LICENSE_FILES.
> 
> Add COPYING sha256 entry to minicom.hash file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/minicom/minicom.hash | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
> index ca3087160b..f49e430c67 100644
> --- a/package/minicom/minicom.hash
> +++ b/package/minicom/minicom.hash
> @@ -1,2 +1,3 @@
>   # Locally calculated
>   sha256 532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1  minicom-2.7.1.tar.gz
> +sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
> 

Since I'm going to send "bump version" patch, please discard this patch
in favour of the new patchset.

Thanks
Giulio Benetti
