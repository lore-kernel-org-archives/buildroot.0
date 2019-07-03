From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:45:03 +0200
Subject: [Buildroot] [PATCH 01/22] package/dosfstools: add license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <168f6078-2b24-2174-0dfd-bde79f7df27a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/07/2019 00:26, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>


 Series applied to master, thanks.

 A few remarks in individual patches.

 Regards,
 Arnout

> ---
>  package/dosfstools/dosfstools.hash | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/dosfstools/dosfstools.hash b/package/dosfstools/dosfstools.hash
> index 2515ea68c3..d5f396f69f 100644
> --- a/package/dosfstools/dosfstools.hash
> +++ b/package/dosfstools/dosfstools.hash
> @@ -1,2 +1,5 @@
>  # Locally calculated after checking pgp signature
>  sha256 e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173  dosfstools-4.1.tar.xz
> +
> +# Locally calculated
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> 
