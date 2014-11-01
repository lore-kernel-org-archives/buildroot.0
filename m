From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 14:52:42 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/tvheadend: Add transcoding
 support by ffmpeg
In-Reply-To: <1414789621-10892-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414789621-10892-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141101145242.32d26c33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 31 Oct 2014 22:07:00 +0100, Bernd Kuhls wrote:
> Add --disable-libffmpeg_static to disable static linking of ffmpeg
> libraries into the tvheadend binary.
> 
> tvheadend compiles with ffmpeg using this minimal defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_PACKAGE_FFMPEG=y
> BR2_PACKAGE_TVHEADEND=y
> 
> ---
> v4: simplify ffmpeg dependency handling, add description for
>     --disable-libffmpeg_static to commit log (Thomas)
> v3: no changes
> v2: add --disable-libffmpeg_static, newly added option to git master
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/Config.in    |    2 ++
>  package/tvheadend/tvheadend.mk |    8 ++++++++
>  2 files changed, 10 insertions(+)

Both patches applied. But *again*, please put your SoB line *before*
the first "---" sign. Everything that is after the first "---" gets
removed by git when applying the patch, so your SoB line disappears.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
