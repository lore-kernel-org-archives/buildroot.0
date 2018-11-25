From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:21:03 +0100
Subject: [Buildroot] [PATCH next v2] qemu: enable seccomp if libseccomp
 is selected
In-Reply-To: <20181125012122.24316-1-casantos@datacom.com.br>
References: <20181125012122.24316-1-casantos@datacom.com.br>
Message-ID: <20181125092103.111d320e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 23:21:22 -0200, Carlos Santos wrote:
> It is required to use qemu with libvirt and allows us to resume working
> on the libvirt package (https://patchwork.ozlabs.org/patch/841613).
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
> Supersedes: https://patchwork.ozlabs.org/patch/1000481/
> ---
> Changes v1->v2:
> - Do not introduce an explicit option, just enable seccomp support when
>   BR2_PACKAGE_LIBSECCOMP=y.
> ---
>  package/qemu/qemu.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
