From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 12:29:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/libndp: fix musl build
In-Reply-To: <1454168407-3108-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454168407-3108-1-git-send-email-bernd.kuhls@t-online.de>
 <1454168407-3108-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207122921.72a1a9ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 16:40:07 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d42/d42bebe51bbec38f131840b6bbefdc162f0ad194/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libndp/0001-ndptool.c-Fix-musl-build.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libndp/0001-ndptool.c-Fix-musl-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
