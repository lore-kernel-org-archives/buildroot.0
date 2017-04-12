From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:52:35 +0200
Subject: [Buildroot] [PATCH 1/5] package/mplayer: fix musl build error
In-Reply-To: <20170410204122.13382-1-bernd.kuhls@t-online.de>
References: <20170410204122.13382-1-bernd.kuhls@t-online.de>
Message-ID: <20170412225235.20962aaa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 22:41:18 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/08e/08ed316677f519c8005928366aea89570527a033/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/0006-musl-ldt.patch | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/mplayer/0006-musl-ldt.patch

All applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
