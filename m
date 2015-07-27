From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:03:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcc: fix gcc 4.7 build with gcc5
In-Reply-To: <1438006860-5990-1-git-send-email-romain.naour@openwide.fr>
References: <1438006860-5990-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150727230325.17235b9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 27 Jul 2015 16:20:59 +0200, Romain Naour wrote:
> gcc 4.7 doesn't build with gcc5.
> 
> Patch is from DragonFlyBSD github [1]
> 
> [1] https://github.com/DragonFlyBSD/DPorts/issues/136
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  .../gcc/4.7.4/844-gcc-fix-build-with-gcc5.patch    | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/gcc/4.7.4/844-gcc-fix-build-with-gcc5.patch

Both applied. Thanks Romain for looking into this issue!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
