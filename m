From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 21 Sep 2019 20:39:17 +0200
Subject: [Buildroot] [PATCH] python-mako: add hash for license file
In-Reply-To: <20190921182429.19778-1-arnout@mind.be>
References: <20190921182429.19778-1-arnout@mind.be>
Message-ID: <226061d9-25ea-04cc-1200-5fc2c63bf75a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 21/09/2019 ? 20:24, Arnout Vandecappelle (Essensium/Mind) a ?crit?:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/python-mako/python-mako.hash | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
> index 6a64ec3123..a0750cf8a2 100644
> --- a/package/python-mako/python-mako.hash
> +++ b/package/python-mako/python-mako.hash
> @@ -1,3 +1,5 @@
>  # md5 from https://pypi.python.org/pypi/mako/json, sha256 locally computed
>  md5 a28e22a339080316b2acc352b9ee631c Mako-1.0.6.tar.gz
>  sha256 48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d Mako-1.0.6.tar.gz
> +# License files, locally computed
> +sha256 84f6f8798990239d697b6d62631dc402962d4fb3895955ea926dce7956baf71b LICENSE

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Checked by using make host-python-mako-legal-info

Best regards,
Romain

> 
