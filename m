From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Thu, 9 Feb 2017 14:41:59 +0100
Subject: [Buildroot] [PATCH 1/6] support/scripts: add script to test a
 package
In-Reply-To: <085941ea3e9e9f34405ac10780d5c8aa2a6317aa.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <085941ea3e9e9f34405ac10780d5c8aa2a6317aa.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <81633cec-5918-f447-9eb9-3c2cde310d5f@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 08/02/2017 21:15, Yann E. MORIN wrote:
> This script helps in testing that a package builds fine on a wide range
> of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [yann.morin.1998 at free.fr:
>  - completely rewrite the script from Thomas, with help from Luca
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> ---
> Changes v2 -> v3:
>   - grammar  (Luca)

There are more changes in reality, not only grammar fixes. So the Acked
and Reviewed-by tags should be removed IMO.

But I'm OK with the new version as well, so:

[tested the exim package with all toolchains, with and without -p,
introducing build, URL and defconfig errors]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
