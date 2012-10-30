From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 13:42:58 +0100
Subject: [Buildroot] [PATCH] package: add libpthsem
In-Reply-To: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <20121030134258.56d25a7b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Hermant,

On Tue, 30 Oct 2012 13:24:00 +0100, Gregory Hermant wrote:

> +LIBPTHSEM_AUTORECONF = YES

Really needed?

> +LIBPTHSEM_INSTALL_TARGET = YES

Not needed.

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
