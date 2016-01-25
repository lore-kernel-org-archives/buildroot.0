From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:16:46 +0100
Subject: [Buildroot] [PATCH 1/3] package/tvheadend: bump version
In-Reply-To: <1453542297-12086-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453542297-12086-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125231646.0bb60f29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 23 Jan 2016 10:44:55 +0100, Bernd Kuhls wrote:
> Default configure options were changed in
> https://github.com/tvheadend/tvheadend/commit/ad9b54ad908fdc9a069c734234958ae8ad1eb38f
> enabling the download of the source of libhdhomerun and its static
> build which will lead to a link error because the host compiler is used
> for that build. Therefore disable the static build of libhdhomerun by
> tvheadend's build system like we do for ffmpeg.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/0001-no-check_config.patch | 4 ++--
>  package/tvheadend/tvheadend.hash             | 2 +-
>  package/tvheadend/tvheadend.mk               | 3 ++-
>  3 files changed, 5 insertions(+), 4 deletions(-)

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
