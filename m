From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:55:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/minicom: fix musl build
In-Reply-To: <1453560118-14646-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453560118-14646-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160127215537.2992a80f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 23 Jan 2016 15:41:58 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/ea7/ea72a5aee30a89251c06e6a916499e39128437c0/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0001-Fix-build-issus-surfaced-due-to-musl.patch | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch

When possible, please use upstream patches rather than OpenEmbedded or
OpenWRT patches. In this case, two commits have been merged upstream to
solve the musl build problems. So I've replaced the single patch from
OpenEmbedded patch by the two upstream commits and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
