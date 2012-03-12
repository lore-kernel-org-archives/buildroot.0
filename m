From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 23:12:41 +0100
Subject: [Buildroot] [PATCH 5/5] Microblaze: Added defconfig for Avnet
 S6LX9 Microboard
In-Reply-To: <4F5CD806.6040209@relinux.de>
References: <4F5CD806.6040209@relinux.de>
Message-ID: <20120312231241.12fa5da5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 11 Mar 2012 17:51:18 +0100,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> 
> ---
>  board/Avnet/Avnet_S6LX9_MicroBoard/README          |   64 +++++

Please use lowercase everywhere, and don't repeat the manufacturer name
in the board subdirectory:

   board/avnet/s6lx9_microboard

>  board/Avnet/Avnet_S6LX9_MicroBoard/TODO            |   19 ++

I'd prefer not to have those "specific" TODO in the code-base. Put it
on the Buildroot Wiki, or in a global TODO at the root directory if you
prefer.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
