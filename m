From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:36:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: fix
 build with composite support disabled
In-Reply-To: <20180107190009.22933-1-bernd.kuhls@t-online.de>
References: <20180107190009.22933-1-bernd.kuhls@t-online.de>
Message-ID: <20180107213619.6c3068cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 20:00:09 +0100, Bernd Kuhls wrote:
> Added upstream to fix
> http://autobuild.buildroot.net/results/44e/44e29c2fb5d236a66e0466698fbc9201a37dbc63/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...clude-compositeext.h-if-COMPOSITE-is-supp.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.19.6/0004-glx-Only-include-compositeext.h-if-COMPOSITE-is-supp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
