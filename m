From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:34:54 +0200
Subject: [Buildroot] [PATCH v3 0/4] Add ARM Cortex-M3 support
In-Reply-To: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150628143454.2b895956@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 26 Jun 2015 14:33:18 -0300, Guido Mart?nez wrote:

> Guido Mart?nez (4):
>   arm: update processor types
>   toolchain: allow for stupid toolchains

Both of these applied.

>   toolchain: introduce BR2_TOOLCHAIN_HAS_RESOLVER
>   toolchain-external: add OSELAS 2014.12.0 Cortex-M3 toolchain

There have been some comments from Yann on these patches, so I've
marked them as "Changes Requested" in patchwork. Could you rework them
as suggested by Yann, and resend updated versions?

Also, now that there is Cortex-M3 support listed, please make sure it
works fine with the internal toolchain backend, and if it doesn't work,
add the appropriate exceptions (for example, glibc and musl cannot be
built for Cortex-M3, as far as I know). Can you send a follow-up patch
for this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
