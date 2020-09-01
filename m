From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Sep 2020 22:16:01 +0200
Subject: [Buildroot] [PATCH 1/3] package/nvidia-tegra23: remove package
In-Reply-To: <20200829113403.122144-1-bernd.kuhls@t-online.de>
References: <20200829113403.122144-1-bernd.kuhls@t-online.de>
Message-ID: <12f98590-768e-8124-eabe-6e2422d93c58@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/08/2020 13:34, Bernd Kuhls wrote:
> Current X.org X server is incompatible with this driver.
> 
> We no longer support unmaintainted versions of X.org X server.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Series applied to next, thanks. The idea is that people should know they're
vulnerable if they select old versions. If we change our minds, we can still
backport to the stable branches. (Note to Peter: backport is not entirely trivial).

 Regards,
 Arnout
