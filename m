From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:38:25 +0100
Subject: [Buildroot] [PATCH 03/10] lua: remove a too invasive patch
In-Reply-To: <71bd835f5a81ab09096181b145853500ad00c9ab.1387744636.git.yann.morin.1998@free.fr>
References: <cover.1387744636.git.yann.morin.1998@free.fr>
 <71bd835f5a81ab09096181b145853500ad00c9ab.1387744636.git.yann.morin.1998@free.fr>
Message-ID: <20131225173825.359218a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Dec 2013 21:42:11 +0100, Yann E. MORIN wrote:
> From: Francois Perrad <fperrad@gmail.com>
> 
> the static version of luac is enough
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/lua/lua-03-shared-libs-for-luac.patch | 97 ---------------------------
>  1 file changed, 97 deletions(-)
>  delete mode 100644 package/lua/lua-03-shared-libs-for-luac.patch

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
