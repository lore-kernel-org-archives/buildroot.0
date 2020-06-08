From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Jun 2020 06:51:08 -0500
Subject: [Buildroot] [PATCH v1 2/2] package/ethtool: bump to 5.7
In-Reply-To: <20200606183817.5113-2-heiko.thiery@gmail.com>
References: <20200606183817.5113-1-heiko.thiery@gmail.com>
 <20200606183817.5113-2-heiko.thiery@gmail.com>
Message-ID: <CANQCQpaaSmzCnwYFBn+FcprC1cuV5Jz2ek7076cHuMbUpT5MCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko,

On Sat, Jun 6, 2020 at 1:43 PM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/ethtool/ethtool.hash | 2 +-
>  package/ethtool/ethtool.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
> index 67fe263315..e3a958ab39 100644
> --- a/package/ethtool/ethtool.hash
> +++ b/package/ethtool/ethtool.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
> -sha256  ca0f1b526dad5153f0aa0f1eb3c17c31770c75a74f70af622b1a83ae38043995  ethtool-5.6.tar.xz
> +sha256  724eb8bd3c3a389fe285735959a1902fbd9310624656ad3220c5f23df1053c39  ethtool-5.7.tar.xz
>  # Locally calculated
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256 5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index c36268544f..40abe57918 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -ETHTOOL_VERSION = 5.6
> +ETHTOOL_VERSION = 5.7

Did you notice by chance if this included GCC10 fixes?

http://autobuild.buildroot.net/results/ce233c3eb6b4384c8fb9749802a0afe223b13b39/build-end.log

Regard,
Matt
