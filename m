From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:47:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Disable broken linking of
 vlc-static
In-Reply-To: <1407073444-31854-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407073444-31854-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140804094750.093cd808@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  3 Aug 2014 15:44:04 +0200, Bernd Kuhls wrote:
> - vlc-0001-vlc-static.patch disables linking of bin/vlc-static
> - remove vlc-0001-fix-link-error.patch as it should have fixed
>   vlc-static, this patch is not needed anymore
> 
> Fixes
> http://autobuild.buildroot.net/results/acc/acc212dc70abbf86be5d764895ee50b1eb64668f/
> http://autobuild.buildroot.net/results/830/83025b9072221f9edaa4638687950f8086e1c19d/
> http://autobuild.buildroot.net/results/0b5/0b59e2d0b17501d10c005292a2e1916f23a12a0e/
> http://autobuild.buildroot.net/results/473/473e601b009d8b045cd6041f3725e9dc81e31f03/
> http://autobuild.buildroot.net/results/3b2/3b2815d27a2252a2d677eed5c479a88bbb04d655/
> http://autobuild.buildroot.net/results/022/022252176c051ff3365b2cb820f32aafc802803a/
> http://autobuild.buildroot.net/results/2db/2dbaa3603b3dab9e06a37993fb235d009bd22df9/
> http://autobuild.buildroot.net/results/0d4/0d4199c3271bbd7cf8a04403c5dafa1178f75fb1/
> http://autobuild.buildroot.net/results/cb8/cb8402fc994697f157348d88f848357ca21156a4/
> http://autobuild.buildroot.net/results/666/6660453c78d1557b645e8fd5b3ed2076e64fc91a/
> http://autobuild.buildroot.net/results/2b9/2b9bbeea4a4b2953b445f54b5ce1b2d8f520451d/
> http://autobuild.buildroot.net/results/7ff/7ff072f9b7487fb27070c58053dbcf96b7dd7a56/
> http://autobuild.buildroot.net/results/ab1/ab1feef329c9da6cd3a4df46b6724030159a4003/
> http://autobuild.buildroot.net/results/bd3/bd3a1bc0c6f333836c1888d8404832de948df739/
> http://autobuild.buildroot.net/results/f70/f708306808953a48f8cc870d13be0e62ed2ece2e/
> http://autobuild.buildroot.net/results/3c5/3c53f6e0f3c0367b760bbf2140acdb06b2b50223/
> http://autobuild.buildroot.net/results/080/080fab04cd252f765dd197c9941470bfdf6ba629/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc-0001-fix-link-error.patch |   28 ----------------------------
>  package/vlc/vlc-0001-vlc-static.patch     |   24 ++++++++++++++++++++++++
>  2 files changed, 24 insertions(+), 28 deletions(-)
>  delete mode 100644 package/vlc/vlc-0001-fix-link-error.patch
>  create mode 100644 package/vlc/vlc-0001-vlc-static.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
