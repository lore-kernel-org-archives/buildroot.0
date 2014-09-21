From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:36:54 +0200
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: Fix compile error
 for microblaze & xtensa
In-Reply-To: <1410084389-5971-1-git-send-email-bernd.kuhls@t-online.de>
References: <1410084389-5971-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140921223654.19237fdc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  7 Sep 2014 12:06:28 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/05f/05f2f1317f366b724c2d6b1bb572bb6778c69896/
> http://autobuild.buildroot.net/results/655/655c00859ea61378739309539d71b38fab62e229/
> http://autobuild.buildroot.net/results/4d3/4d37c5594c0916c27c897b0d2545d1c5cc492598/
> http://autobuild.buildroot.net/results/d1a/d1af06d73ee0fd57ee0ad8b371927b2f9478d44e/
> http://autobuild.buildroot.net/results/5cc/5cceb96ac29a410316fd7d8f7de0615ba33e3f2c/
> http://autobuild.buildroot.net/results/143/14308a9d1806574f06ab2a7d222f53119fab1c90/
> http://autobuild.buildroot.net/results/c6a/c6a5bbee21b5c4ce84c6a95bd764f294d3791720/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../xserver_xorg-server-0002-glyphpadbytes.patch   |  232 ++++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
