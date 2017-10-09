From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 9 Oct 2017 21:31:59 +0200
Subject: [Buildroot] [PATCH 0/6] Update Linaro toolchain on 2017.02.x
	branch
In-Reply-To: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
References: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
Message-ID: <18255276-245a-b6eb-ad34-55dceeba7bf4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marc,

Le 09/10/2017 ? 17:45, Marc Gonzalez a ?crit?:
> Hello Peter,
> 
> As discussed on IRC, here is the patch series to update the
> Linaro toolchain on the 2017.02.x branch
> 
> It boils down to:
> $ git cherry-pick -sx 075d26900b4f 52f059f38d46 641fe0e39240 aed5a0fcf7c0 90524c69f42b 0365f41c874e
> 
> And adding the following blurb to aed5a0fcf7c0 90524c69f42b 0365f41c874e
> 
> 6.4-2017.08 includes several patches for glibc 2.23 mitigating
> some of the "stack clash" vulnerabilities reported by Qualys.
> 
> https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt
> https://git.linaro.org/toolchain/glibc.git/log/?h=linaro/2.23/master

Thanks for these patches for 2017.02.x stable branch.

However, it seems that your patches are not in the patchwork since you're not
subscribed in the mailing list.
Patchwork is really useful for maintainers to fetch and apply patches.

Best regards,
Romain

> 
> 
> Romain Naour (6):
>   toolchain-external: bump Linaro ARM toolchain to 2017.02
>   toolchain-external: bump Linaro ARMeb toolchain to 2017.02
>   toolchain-external: bump Linaro AArch64 toolchain to 2017.02
>   toolchain-external: bump version of Linaro ARM toolchain to 2017.08
>   toolchain-external: bump version of Linaro ARMeb toolchain to 2017.08
>   toolchain-external: bump version of Linaro AArch64 toolchain to 2017.08
> 
>  .../toolchain-external-linaro-aarch64/Config.in                   | 2 +-
>  .../toolchain-external-linaro-aarch64.hash                        | 4 ++--
>  .../toolchain-external-linaro-aarch64.mk                          | 8 ++++----
>  .../toolchain-external/toolchain-external-linaro-arm/Config.in    | 6 +++---
>  .../toolchain-external-linaro-arm.hash                            | 4 ++--
>  .../toolchain-external-linaro-arm.mk                              | 8 ++++----
>  .../toolchain-external/toolchain-external-linaro-armeb/Config.in  | 6 +++---
>  .../toolchain-external-linaro-armeb.hash                          | 4 ++--
>  .../toolchain-external-linaro-armeb.mk                            | 8 ++++----
>  9 files changed, 25 insertions(+), 25 deletions(-)
> 
