From: Mason <slash.tmp@free.fr>
Date: Mon, 16 Oct 2017 09:08:55 +0200
Subject: [Buildroot] [PATCH 0/6] Update Linaro toolchain on 2017.02.x
	branch
In-Reply-To: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
References: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
Message-ID: <4ecf2bc5-f5b4-6145-04d5-84af39b256a9@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/2017 17:45, Marc Gonzalez wrote:

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
> 
> 
> Romain Naour (6):
>   toolchain-external: bump Linaro ARM toolchain to 2017.02
>   toolchain-external: bump Linaro ARMeb toolchain to 2017.02
>   toolchain-external: bump Linaro AArch64 toolchain to 2017.02
>   toolchain-external: bump version of Linaro ARM toolchain to 2017.08
>   toolchain-external: bump version of Linaro ARMeb toolchain to 2017.08
>   toolchain-external: bump version of Linaro AArch64 toolchain to 2017.08

Hello Peter,

Is something holding up this patch series?

Regards.
