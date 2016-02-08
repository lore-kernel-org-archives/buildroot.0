From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 16:36:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: fix musl build
In-Reply-To: <1453637930-22647-2-git-send-email-bernd.kuhls@t-online.de>
References: <1453637930-22647-1-git-send-email-bernd.kuhls@t-online.de>
 <1453637930-22647-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160208163611.70a71008@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 13:18:50 +0100, Bernd Kuhls wrote:
> The autobuilders did not catch the error yet because they failed
> earlier with other packages, but I am continuing the build based
> on the defconfig from:
> http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Please use more descriptive patch description, use Git to format the
patches, and submit those upstream, since upstream is active on Github:
https://github.com/appneta/tcpreplay.

Due to this, the patches should be in an upstreamable state, i.e not
break other platforms.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
