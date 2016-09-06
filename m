From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:36:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: use
 BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <20160905210056.24393-1-bernd.kuhls@t-online.de>
References: <20160905210056.24393-1-bernd.kuhls@t-online.de>
Message-ID: <20160906213619.6ce99dd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Sep 2016 23:00:56 +0200, Bernd Kuhls wrote:
> It uses __atomic_fetch_add_4 so libatomic must be pulled in if
> necessary. Fixes
> http://autobuild.buildroot.net/results/652/6521223b426c3cb4dfefab27bc6021900db6910e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/opencv3/Config.in  | 2 ++
>  package/opencv3/opencv3.mk | 5 +++++
>  2 files changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
