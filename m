From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 26 Aug 2018 17:10:16 +0200
Subject: [Buildroot] [PATCH v4 3/3] minicom: add license
In-Reply-To: <20180826122308.90382-4-giulio.benetti@micronovasrl.com>
References: <89c54af3-3000-d0c5-ab7f-f6d4f4c092eb@micronovasrl.com>
 <20180826122308.90382-1-giulio.benetti@micronovasrl.com>
 <20180826122308.90382-4-giulio.benetti@micronovasrl.com>
Message-ID: <01b4239a-15ce-0176-11e0-9f9eee51a9fd@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 26/08/2018 14:23, Giulio Benetti ha scritto:
> minicom package has not license.
> 
> Add COPYING file to MINICOM_LICENSE_FILES and its sha256 to .hash file.
> Add MINICOM_LICENSE = GPL-2.0+ according to minicom COPYING informations.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/minicom/minicom.hash | 1 +
>   package/minicom/minicom.mk   | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
> index 0e94e566e7..14998edee1 100644
> --- a/package/minicom/minicom.hash
> +++ b/package/minicom/minicom.hash
> @@ -1,2 +1,3 @@
>   # Locally calculated
>   sha256 3bd58b594ac66545649c13ab2b728a4df0f78612eb030680d4152f7627d1f177  minicom-19ab49422f3431102c31fea01549121385113f80.tar.gz
> +sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
> \ No newline at end of file

I've just realized this breaks make legal-info.
Do I need to resend patchset as v5?

Thanks
Giulio Benetti
