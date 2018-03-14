From: =?utf-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>
Date: Wed, 14 Mar 2018 12:04:44 -0400 (EDT)
Subject: [Buildroot] [PATCH v3 3/6] package/llvm: enable AMDGPU
In-Reply-To: <20180309164939.16075-4-valentin.korenblit@smile.fr>
References: <20180309164939.16075-1-valentin.korenblit@smile.fr>
 <20180309164939.16075-4-valentin.korenblit@smile.fr>
Message-ID: <1463844219.140867.1521043484417.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- On Mar 9, 2018, at 11:49 AM, Valentin Korenblit valentin.korenblit at smile.fr wrote:

> The AMDGPU backend provides ISA code generation for AMD GPU's,
> starting with the R600 family up until the current GCN families.
> 
> It should not be confused with the AMDGPU Linux kernel DRM driver.
> 
> For more info: https://llvm.org/docs/AMDGPUUsage.html
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>

Tested with an AMD Carrizo GPU, works like a charm.

Tested-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
