From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:06:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: bump to version 2.0.6
In-Reply-To: <20190921084257.12456-1-adrien@gallouet.fr>
References: <20190921084257.12456-1-adrien@gallouet.fr>
Message-ID: <aae6569b-810a-3a60-b35c-e4c0ac729c14@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 10:42, Adrien Gallou?t wrote:
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/bird/bird.hash | 2 +-
>  package/bird/bird.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bird/bird.hash b/package/bird/bird.hash
> index 5e7296c0ab..b7485f6444 100644
> --- a/package/bird/bird.hash
> +++ b/package/bird/bird.hash
> @@ -1,2 +1,2 @@
> -sha256 676010b7517d4159b9af37401c26185f561ffcffeba73690a2ef2fad984714de  bird-2.0.4.tar.gz
> +sha256 90934cce6ae90039ab1e58ade223935f9221a7e5eac05df6fb53045b77bfd3aa  bird-2.0.6.tar.gz
>  sha256 94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
> diff --git a/package/bird/bird.mk b/package/bird/bird.mk
> index 8fe585b935..267968afb1 100644
> --- a/package/bird/bird.mk
> +++ b/package/bird/bird.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIRD_VERSION = 2.0.4
> +BIRD_VERSION = 2.0.6
>  BIRD_SITE = ftp://bird.network.cz/pub/bird
>  BIRD_LICENSE = GPL-2.0+
>  BIRD_LICENSE_FILES = README
> 
