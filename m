From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:21:38 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/live555: Add a pkg-config
 file for the shared libraries
In-Reply-To: <20180818182258.2936-1-bernd.kuhls@t-online.de>
References: <20180818182258.2936-1-bernd.kuhls@t-online.de>
Message-ID: <20180820232138.1143de3d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 20:22:56 +0200, Bernd Kuhls wrote:
> Needed for vlc to fix linking issue.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next, thanks.

> +Upstream status: Rejected
> +http://lists.live555.com/pipermail/live-devel/2013-January/016374.html
> +http://lists.live555.com/pipermail/live-devel/2013-January/016375.html

Wow. So everybody needs it (Debian, VLC, now Buildroot), and the answer
of upstream is "it's a distribution problem". Interesting.

Could you try to send it again ? Maybe 5 years later the maintainer
will have changed his mind, especially if you show that Debian, VLC and
Buildroot need it ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
