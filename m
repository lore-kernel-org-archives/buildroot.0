From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 14 Nov 2013 14:24:18 -0500
Subject: [Buildroot] [PATCH 3/5] linux: ensure buildroot_defconfig is
	writable
In-Reply-To: <ba483991a0f3ff8d099f66bd9310a7f4357418b6.1384454667.git.yann.morin.1998@free.fr>
References: <cover.1384454667.git.yann.morin.1998@free.fr>
 <ba483991a0f3ff8d099f66bd9310a7f4357418b6.1384454667.git.yann.morin.1998@free.fr>
Message-ID: <CANxTyt6=9SpdLxapvAu039-FEhVzoFNKqczMvPYfC2_zPrAtvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 14, 2013 at 1:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> If $(KERNEL_SOURCE_CONFIG) is read-only (eg. becasue Buildroot's source
> dir is), the rm of $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig will
> either fail, or prompt the user, both of which we want to avoid.
>
> Make it writable by using $(INSTALL).
>
> Fixes: #4363
> Signed-off-by: Nathan Lynch <ntl@pobox.com>
> [yann.morin.1998 at free.fr: use $(INSTALL) instead of cp, don't 'rm -f']
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

nitpick: "because" is misspelled.
Danomi -
