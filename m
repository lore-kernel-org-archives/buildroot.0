From: yann.morin.1998 at free.fr <yann.morin.1998@free.fr>
Date: Sun, 03 Feb 2013 13:50:38 +0100
Subject: [Buildroot] [PATCH 2/2] tvheadend: disable on avr32
In-Reply-To: <1359893728-4345-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1359893728-4345-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1359893728-4345-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1359895838.510e5d1e42886@imp.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Quoting Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> tvheadend requires an atomic_add operation. Either you have a gcc >=
> 4.3 toolchain and it uses the gcc intrinsics, or it has special code
> for x86, x86-64, PPC and ARM. So in the context of Buildroot, the only
> really problematic architecture is avr32, which uses gcc 4.2.
>
> Fixes
>
http://autobuild.buildroot.org/results/f015b1888d739c383aca61609059aa7675a4da7d/build-end.log
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.
