From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 23:56:20 +0200
Subject: [Buildroot] [PATCH 2/3] package/tinc: optionally include
 linux/if_tun.h to fix musl build
In-Reply-To: <1463919991-28382-2-git-send-email-bernd.kuhls@t-online.de>
References: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
 <1463919991-28382-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160525235620.662a768e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 14:26:30 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/5b1/5b1d0c8c1bd75f7e228c313cb21b1638301568ae/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tinc/0001-musl.patch | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/tinc/0001-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
