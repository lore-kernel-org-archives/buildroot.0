From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 02 May 2013 18:15:56 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce
	BR2_ARCH_HAS_GCC_x_y
In-Reply-To: <1367503625-31148-1-git-send-email-mjonker@synopsys.com>
References: <1367503625-31148-1-git-send-email-mjonker@synopsys.com>
Message-ID: <5182913C.7060400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/13 16:07, Mischa Jonker wrote:
> This patch eliminates the long "depends on" lines in
> toolchain/gcc/Config.in by letting architectures specify
> which GCC versions they support.
>
> Signed-off-by: Mischa Jonker<mjonker@synopsys.com>
> ---
>   arch/Config.in          |    9 ++++++
>   arch/Config.in.arm      |   40 ++++++++++++++++++++++++++++
>   arch/Config.in.powerpc  |   66 +++++++++++++++++++++++++++++++++++++++++++++++
>   arch/Config.in.sparc    |    5 +++
>   arch/Config.in.x86      |   31 ++++++++++++++++++++++
>   toolchain/gcc/Config.in |   45 +++++++++++++++++++++++++++-----
>   6 files changed, 189 insertions(+), 7 deletions(-)

  The fact that this refactoring has 189 insertions and 7 deletions 
already indicates that it can't be such a great idea...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
