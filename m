From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 09:32:21 +0100
Subject: [Buildroot] [PATCH 03/29] package/qemu: add basic target
 selection
In-Reply-To: <333827ac19a2c39c08f387b846078441478d87af.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
 <333827ac19a2c39c08f387b846078441478d87af.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <20130130093221.05bc0131@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 29 Jan 2013 23:43:47 +0100, Yann E. MORIN wrote:
> qemu-1.2.1 requires that at least one target emulation be enabled, so
> we use some kconfig-tricks to force at least the systems emulations to
> be enabled if user emulation is not selected.
> 
> This limitation will be lifted in the upcoming qemu-1.3.x

Humm, the qemu package actually uses version 1.3.1, as per "[PATCH
01/29] package/qemu: bump version to 1.3.1" :-)

You also have the comment related to 1.2.x in the patch itself.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
