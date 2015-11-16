From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 23:05:53 +0100
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-video-siliconmotion: Fix compile warnings being
 treated as error
In-Reply-To: <1447004673-18164-2-git-send-email-bernd.kuhls@t-online.de>
References: <1447004673-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <1447004673-18164-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151116230553.4a20d31c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  8 Nov 2015 18:44:33 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/059/059d771cb39532dee73a5f50e24b3441005ed38b/
> http://autobuild.buildroot.net/results/542/5429dd3f07430cf1487a8cfa82ba55e66a640473/
> http://autobuild.buildroot.net/results/073/073105a692033665d31b2dc034eff2e0fdca7f10/
> http://autobuild.buildroot.net/results/018/01805d60b8b046122d357e2559268e8a45dcf9d3/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../xdriver_xf86-video-siliconmotion.mk                                 | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
