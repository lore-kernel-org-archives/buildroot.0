From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 19:49:24 +0200
Subject: [Buildroot] [PATCH] barebox: fix license information
In-Reply-To: <1345639653-17544-1-git-send-email-spdawson@gmail.com>
References: <1345639653-17544-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120822194924.268ac192@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 13:47:33 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> The barebox license is GPLv2, and not GPLv2+.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Thanks, applied.

However, the Barebox license, just like U-Boot license, has a special
exception to allow proprietary standalone applications to be linked
against parts of Barebox/U-Boot without having to be released under the
GPL. Should be use "GPLv2 with exceptions"? Or something else?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
