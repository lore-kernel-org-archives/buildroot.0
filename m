From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 14:41:56 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/qt5base: link with -latomic
	for	sparc
References: <cover.1495055675.git.yann.morin.1998@free.fr>
 <6bdfcdff79478a9835c4c5d0296f8f62d5b64d66.1495055675.git.yann.morin.1998@free.fr>
Message-ID: <kp8ovdxale.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 17 May 2017 23:15:29 +0200 schrieb Yann E. MORIN:

> Qt 5.8 needs atomic operations, which are provided in libatomic when it
> exists, ike on sparc with gcc >= 4.8.
> 
> Fixes:
>     http://autobuild.buildroot.org/
results/49b/49bc9345b9849c9c3c53ace290c534ff7bb98683/
>     http://autobuild.buildroot.org/
results/9f2/9f213406954be51dfcad76ebdce8b73850842180/
> 
> Signed-off-by: "Yann E. MORIN"
> <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested using http://autobuild.buildroot.net/
results/967/967e7b7b6960ff49afc5c845832abd49d93ed676/ )

This patch series also fixes http://autobuild.buildroot.net/
results/967/967e7b7b6960ff49afc5c845832abd49d93ed676/
