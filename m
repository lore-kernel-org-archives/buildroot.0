From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 May 2017 06:34:00 +0300
Subject: [Buildroot] [PATCH 2/2 v2] package/qt5base: link with -latomic
 for sparc
In-Reply-To: <6bdfcdff79478a9835c4c5d0296f8f62d5b64d66.1495055675.git.yann.morin.1998@free.fr>
References: <cover.1495055675.git.yann.morin.1998@free.fr>
 <6bdfcdff79478a9835c4c5d0296f8f62d5b64d66.1495055675.git.yann.morin.1998@free.fr>
Message-ID: <20170518033400.oh4mq2zywtjs7dhr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, May 17, 2017 at 11:15:29PM +0200, Yann E. MORIN wrote:
> Qt 5.8 needs atomic operations, which are provided in libatomic when it
> exists, ike on sparc with gcc >= 4.8.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/49b/49bc9345b9849c9c3c53ace290c534ff7bb98683/
>     http://autobuild.buildroot.org/results/9f2/9f213406954be51dfcad76ebdce8b73850842180/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> 
> ---
> Changes v1 -> v2:
>   - condition is on HAS_LIBATOMIC, not on BR2_sparc  (Thomas)

The commit subject line should also to match that change.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
