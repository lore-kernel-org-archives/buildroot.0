From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 19:28:51 +0100
Subject: [Buildroot] [PATCH 3/4] package/dvb-apps: bump version
In-Reply-To: <8ff24edea518d291706dddec42aa360cef4176ed.1385937338.git.yann.morin.1998@free.fr>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
 <8ff24edea518d291706dddec42aa360cef4176ed.1385937338.git.yann.morin.1998@free.fr>
Message-ID: <20131222192851.037f3123@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  1 Dec 2013 23:36:06 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Fixes for scanning DVBS, misc compiler warnings suppressed.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/dvb-apps/dvb-apps.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I don't know if it is happening since this bump, but there are some
dvb-apps build failure in the autobuilders:

  http://autobuild.buildroot.org/results/7f6/7f69d253ffcdd285ab73616c5748e46a796ebfb8/build-end.log

Care to have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
