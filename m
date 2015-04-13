From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 01:32:25 +0200
Subject: [Buildroot] [PATCH 1/8 v4] package/gcc: add hashes
In-Reply-To: <f78c5a1a3e8998f0e32d08fc7c5a63dea083f4c4.1428512075.git.yann.morin.1998@free.fr>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
 <f78c5a1a3e8998f0e32d08fc7c5a63dea083f4c4.1428512075.git.yann.morin.1998@free.fr>
Message-ID: <552C5209.7040504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 18:57, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/gcc/gcc-final/gcc-final.hash     | 1 +
>  package/gcc/gcc-initial/gcc-initial.hash | 1 +
>  package/gcc/gcc.hash                     | 7 +++++++
>  3 files changed, 9 insertions(+)
>  create mode 120000 package/gcc/gcc-final/gcc-final.hash
>  create mode 120000 package/gcc/gcc-initial/gcc-initial.hash
>  create mode 100644 package/gcc/gcc.hash
> 
> diff --git a/package/gcc/gcc-final/gcc-final.hash b/package/gcc/gcc-final/gcc-final.hash
> new file mode 120000
> index 0000000..7ac9361
> --- /dev/null
> +++ b/package/gcc/gcc-final/gcc-final.hash
> @@ -0,0 +1 @@
> +../gcc.hash
> \ No newline at end of file
> diff --git a/package/gcc/gcc-initial/gcc-initial.hash b/package/gcc/gcc-initial/gcc-initial.hash
> new file mode 120000
> index 0000000..7ac9361
> --- /dev/null
> +++ b/package/gcc/gcc-initial/gcc-initial.hash
> @@ -0,0 +1 @@
> +../gcc.hash
> \ No newline at end of file
> diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> new file mode 100644
> index 0000000..d9a04fc
> --- /dev/null
> +++ b/package/gcc/gcc.hash
> @@ -0,0 +1,7 @@
> +# Locally computed (upstream only has sigs):

 Which upstream is that?

# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.5.4/sha512.sum
sha512	78696b287d46aacd6f150920da376ea32f58ad9f0dafd2d3b7fa6dbdd8dd7afe659108d1dfaa5807617fc5248719f50b39c37ade0173ea5b9fec2091f4656115	gcc-4.5.4.tar.bz2
# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.7.4/sha512.sum
sha512	dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e3f0f227eb43cdf90e0d34cde5abdc9ac892c1e111a911062a66c9189	gcc-4.7.4.tar.bz2
# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.4/sha512.sum
sha512	b4c84ebd754c026029d706ef52c4242df4dcadc6a22cc5669b3aa37ac9dc25bc9cd9651fda83fb24dd5d17b1710e6865a35bb6c5cd9b95d0971717453935ae8e	gcc-4.8.4.tar.bz2
# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/sha512.sum
sha512	e96cba06d572dbe7f382a2b00fd9297dcf9f9219d46a9ad0bd904dc36d5e7db3335e422640b79a27fed6fde91b0731732b94a0e2fbcd47344d6779f8ba1f4f9c	gcc-4.9.2.tar.bz2


 Regards,
 Arnout

> +sha256  eef3f0456db8c3d992cbb51d5d32558190bc14f3bc19383dd93acc27acc6befc  gcc-4.5.4.tar.bz2
> +sha256  92e61c6dc3a0a449e62d72a38185fda550168a86702dea07125ebd3ec3996282  gcc-4.7.4.tar.bz2
> +sha256  4a80aa23798b8e9b5793494b8c976b39b8d9aa2e53cd5ed5534aff662a7f8695  gcc-4.8.4.tar.bz2
> +sha256  2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd  gcc-4.9.2.tar.bz2
> +# No hash for the ARC variant, comes from the github-helper:
> +none    xxx                                                               gcc-arc-2014.12.tar.gz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
