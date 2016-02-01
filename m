From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 23:51:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/faifa: fix musl build
In-Reply-To: <1454167986-27614-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454167986-27614-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160201235145.5095f8e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 16:33:06 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/dc6/dc6e4d7327d2031ef921cccd814605dec73a0f9c/
> http://autobuild.buildroot.net/results/868/868642325dbcd581373eaa9e1ef900f8a27f9121/
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...do-not-include-linux-if_ether.h-for-musl-.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
