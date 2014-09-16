From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 22:07:39 +0200
Subject: [Buildroot] [PATCH] portmap: fix static linking
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C68C8AD946@ex-mb3.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AD946@ex-mb3.corp.adtran.com>
Message-ID: <20140916220739.16ecb50d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Mon, 8 Sep 2014 21:43:45 +0000, ANDY KENNEDY wrote:
> Portmap builds and links, however, does not get built correctly when
> BR2_PREFER_STATIC_LIB is selected.  There are no dynamic libraries in
> rootfs.tar, however, portmap gets linked dynamically without regards to
> the PREFER_STATIC_LIB tags.  LDFLAGS was not being passed into the build of
> portmap.
> 
> Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
