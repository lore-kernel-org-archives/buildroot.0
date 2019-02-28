From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Feb 2019 23:51:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: add riscv emulation on
 host variant
In-Reply-To: <20190227174309.8209-1-juju@cotds.org>
References: <20190227174309.8209-1-juju@cotds.org>
Message-ID: <20190228235118.0f51a3ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Feb 2019 18:43:09 +0100
Julien Olivain <juju@cotds.org> wrote:

> RISC-V support was added in qemu 2.12. This target emulation
> in host qemu can now be enabled.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  package/qemu/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
