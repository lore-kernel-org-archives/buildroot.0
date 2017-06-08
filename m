From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:21:28 +0200
Subject: [Buildroot] [PATCH 0/2 v2] package/qt5base: fix sparc
 compilation
In-Reply-To: <cover.1495055675.git.yann.morin.1998@free.fr>
References: <cover.1495055675.git.yann.morin.1998@free.fr>
Message-ID: <20170608232128.2c5d553c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 May 2017 23:15:23 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (2):
>       package/qt5base: install arch-specific configuration
>       package/qt5base: link with -latomic for sparc

Both applied to master. Thanks!

Peter: those are fixing a build issue, but only on Sparc, so I don't
know how much we want those patches in the LTS branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
