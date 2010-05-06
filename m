From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 May 2010 18:06:31 +0200
Subject: [Buildroot] Commit "Remove BR2_GNU_TARGET_SUFFIX and compute
 GNU_TARGET_NAME"
In-Reply-To: <i2h32a6c48b1005060824nb4df8741p655241e4ce1b0f7e@mail.gmail.com>
References: <i2h32a6c48b1005060824nb4df8741p655241e4ce1b0f7e@mail.gmail.com>
Message-ID: <20100506180631.3333594c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 6 May 2010 16:24:58 +0100
Quotient Remainder <quotientvremainder@gmail.com> wrote:

> http://git.buildroot.net/buildroot/commit/?id=65e80a0b0bf275e0ffdbb611706bec4b1b4719b1
> 
> This patch would seem to prevent Codesourcery toolchains from working.  They
> use "arm-none-linux-gnueabi-*" (no $(LIB) part).
> I suppose you can't take everyone into account but was just curious to know
> if this was taken into account.

The GNU target name is distinct from the toolchain prefix. For external
toolchains, the toolchain prefix is still configurable using the
BR2_TOOLCHAIN_EXTERNAL_PREFIX configuration option.

If you have any issue, could you post the corresponding build log
and .config file ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
