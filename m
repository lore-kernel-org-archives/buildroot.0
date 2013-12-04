From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Dec 2013 09:44:19 +0100
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
 <1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131204094419.6d4d4279@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  3 Dec 2013 21:40:48 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in.host             |  1 +
>  package/qemu-system/Config.in.host | 30 ++++++++++++++++++
>  package/qemu-system/qemu-system.mk | 64 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100644 package/qemu-system/Config.in.host
>  create mode 100644 package/qemu-system/qemu-system.mk

The first question that comes to mind is why we have a separate
"qemu-system" package for this, instead of improving the existing
"qemu" package, which already builds Qemu for the host, but only builds
the user emulation mode?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
