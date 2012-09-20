From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 20:49:08 +0200
Subject: [Buildroot] [PATCH 0/11 v3] Rework the gettext handling
In-Reply-To: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120920204908.65ca34d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Sep 2012 00:57:45 +0200, Yann E. MORIN wrote:

> This patch series is an aggregation of the gettext rework by Samuel,
> Maxime, Thomas, and I.
> 
> See this post for the 6 first patches:
> http://lists.busybox.net/pipermail/buildroot/2012-July/055871.html
> 
>     [PATCH 01/11] gettext: remove option to build statically
>     [PATCH 02/11] gettext: remove the gettext-target make target, unused
>     [PATCH 03/11] gettext: remove libintl handling
>     [PATCH 04/11] Remove all references to libintl
>     [PATCH 05/11] gettext: convert to autotools-package
>     [PATCH 06/11] doc: update after gettext changes
> 
> The following 2 patches fix two packages in preparation for the end of the
> series:
> 
>     [PATCH 07/11] package/lshw: add missing dependency on gettext
>     [PATCH 08/11] package/pulseaudio: fix build-dependency on gettext

For patches 1 to 8,

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter, please merge as soon as possible so we can make progress on
this. Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
