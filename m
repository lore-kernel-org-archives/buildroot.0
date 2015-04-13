From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 01:35:38 +0200
Subject: [Buildroot] [PATCH 2/8 v4] package/binutils: add hashes
In-Reply-To: <1fedcd0068d180c92addf908097b04c389f05e9a.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
 <1fedcd0068d180c92addf908097b04c389f05e9a.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <552C52CA.3070608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 18:57, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/binutils/binutils.hash | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 package/binutils/binutils.hash
> 
> diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
> new file mode 100644
> index 0000000..4f99514
> --- /dev/null
> +++ b/package/binutils/binutils.hash
> @@ -0,0 +1,7 @@
> +# Locally computed:
> +sha256 6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6313ca9  binutils-2.22.tar.bz2
> +sha256 fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097  binutils-2.23.2.tar.bz2
> +sha256 e5e8c5be9664e7f7f96e0d09919110ab5ad597794f5b1809871177a0f0f14137  binutils-2.24.tar.bz2
> +sha256 22defc65cfa3ef2a3395faaea75d6331c6e62ea5dfacfed3e2ec17b08c882923  binutils-2.25.tar.bz2
> +# No hash for the ARC variant, comes from the github-helper:
> +none   xxx                                                               binutils-arc-2014.12.tar.gz
> 

# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
sha512	ffe8ef263ef99183e8cc823fe8487ff7d0f7bf9a8efd2853b5f4636aca0023850d13de4eac7d77a5f69413d8a50e6f95bb14569be53df86c0bce38034525ab74	binutils-2.22.tar.bz2
sha512	dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0a4ba38c43d2434da007137780cfe674de5414be5cf7ce7fbc6af6d16	binutils-2.23.2.tar.bz2
sha512	5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12	binutils-2.24.tar.bz2
sha512	49438970642f379978aba988e3d2e7b63dab6fd0b46d91f4100f083e87a84d242089daca58572245fe620457a77bbbe2d78588ff3fb79314e500d1a39bf96f30	binutils-2.25.tar.bz2

(Just cut&paste from the ftp site, not tested.)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
