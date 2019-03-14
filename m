From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:30:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: update to 2.0.18
In-Reply-To: <20190313083557.13418-1-adrien@gallouet.fr>
References: <20190313083557.13418-1-adrien@gallouet.fr>
Message-ID: <20190314213052.1ec8582b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 08:35:58 +0000
Adrien Gallou?t <adrien@gallouet.fr> wrote:

> This release fixes the following issue with new kernels:
> 
> kexec --load bzImage --reuse-cmdline
> Unhandled rela relocation: R_X86_64_PLT32
> 
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> ---
>  package/kexec/kexec.hash | 2 +-
>  package/kexec/kexec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
