From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Apr 2015 18:42:06 +0200
Subject: [Buildroot] [PATCH 2/7 v5] package/binutils: add hashes
In-Reply-To: <cd2e5bb95ea73288d7cc3dea3b9930b7fd7effb5.1429447148.git.yann.morin.1998@free.fr>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
 <cd2e5bb95ea73288d7cc3dea3b9930b7fd7effb5.1429447148.git.yann.morin.1998@free.fr>
Message-ID: <5533DADE.1000008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 14:44, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
> Changes v4 -> v5:
>   - use alternate upstream as source for hashes  (Arnout)
> ---
>  package/binutils/binutils.hash | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 package/binutils/binutils.hash
> 
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> new file mode 100644
> index 0000000..028fc10
> --- /dev/null
> +++ b/package/binutils/binutils.hash
> @@ -0,0 +1,7 @@
> +# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
> +sha512  ffe8ef263ef99183e8cc823fe8487ff7d0f7bf9a8efd2853b5f4636aca0023850d13de4eac7d77a5f69413d8a50e6f95bb14569be53df86c0bce38034525ab74  binutils-2.22.tar.bz2
> +sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0a4ba38c43d2434da007137780cfe674de5414be5cf7ce7fbc6af6d16  binutils-2.23.2.tar.bz2
> +sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
> +sha512  49438970642f379978aba988e3d2e7b63dab6fd0b46d91f4100f083e87a84d242089daca58572245fe620457a77bbbe2d78588ff3fb79314e500d1a39bf96f30  binutils-2.25.tar.bz2
> +# No hash for the ARC variant, comes from the github-helper:
> +none   xxx                                                               binutils-arc-2014.12.tar.gz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
