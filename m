From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:58:22 +0200
Subject: [Buildroot] [PATCH 0/9 v4] graph-depends improvements (branch
 yem/graphs)
In-Reply-To: <cover.1402236171.git.yann.morin.1998@free.fr>
References: <cover.1402236171.git.yann.morin.1998@free.fr>
Message-ID: <20140608165822.569b1403@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  8 Jun 2014 16:03:49 +0200, Yann E. MORIN wrote:

> This series brings a few improvements to the graph-depends utility:
> 
>   - add option to remove transitive dependencies
>   - add option to pas arbitrary args to the dot utility
>   - cleanup and re-arrange the code

Patches applied, thanks a lot!

A few comments though:

 - I believe we should make the transitive option the default one. It
   really makes the graph a lot more readable.

 - I saw some discussions about the colors, and I agree with Yann that
   the default colors chosen to distinguish the various types of
   packages (host, target, toolchain, rootfs) are too close to each
   other. Initially, I did not even notice the difference between
   colors.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
