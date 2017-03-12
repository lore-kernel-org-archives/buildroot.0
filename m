From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:29:15 +0100
Subject: [Buildroot] [PATCH 0/4] package/nbd: fixes and bump
In-Reply-To: <cover.1489312674.git.yann.morin.1998@free.fr>
References: <cover.1489312674.git.yann.morin.1998@free.fr>
Message-ID: <20170312142915.27e2025b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 10:58:15 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (4):
>       package/nbd: rename options
>       package/nbd: fix utilities locations
>       package/nbd: add option for the trdump utility
>       package/nbd: bump version

Applied, thanks!

Peter: I believe we want to apply PATCH 2/4 to the LTS branch. However,
it will conflict a bit because Yann did the renaming of options before
the fix, but the conflicts should be trivial to resolve.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
