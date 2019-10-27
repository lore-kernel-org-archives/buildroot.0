From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:31:16 +0100
Subject: [Buildroot] [PATCH v5,
 1/1] package/libopenssl: set no-asm with generic architectures
In-Reply-To: <20191019122759.529-1-fontaine.fabrice@gmail.com>
References: <20191019122759.529-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027103116.092115e9@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Oct 2019 14:27:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use no-asm when building with generic architectures such as gcc or
> linux-generic32, see https://github.com/openssl/openssl/issues/9839
> 
> This will fix a static build failure on x86_64 due to the removal of
> x86/x86_64 BSAES and AES_ASM support by
> https://github.com/openssl/openssl/commit/87bea6550ae0dda7c40937cff2e86cc2b0b09491
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e4f04bb13ec1b82b73db645bea4933e52bca4185
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v4 -> v5 (after review of Thomas Petazzoni):
>  - Reword commit message to remove statically

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
