From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 14:41:57 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/qt5base: install
	arch-specific	configuration
References: <cover.1495055675.git.yann.morin.1998@free.fr>
 <79662cee8b26cb83d7c7e76effcdf5a217112d82.1495055675.git.yann.morin.1998@free.fr>
Message-ID: <lp8ovdxale.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 17 May 2017 23:15:28 +0200 schrieb Yann E. MORIN:

> For some architectures, it is necessary to link with additional
> libraries, such as -latomic for sparc.
> 
> Add a bit of support to make that easy; actual use will be introduced in
> the following patch.
> 
> Signed-off-by: "Yann E. MORIN"
> <yann.morin.1998@free.fr> Cc: Julien Corjon
> <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested using http://autobuild.buildroot.net/
results/967/967e7b7b6960ff49afc5c845832abd49d93ed676/ )

This patch series also fixes http://autobuild.buildroot.net/
results/967/967e7b7b6960ff49afc5c845832abd49d93ed676/
