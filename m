From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 13:34:03 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/mplayer: bump version to
 1.3.0
In-Reply-To: <1464427644-18229-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464427644-18229-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160528133403.14ec08ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 11:27:24 +0200, Bernd Kuhls wrote:
> Added upstream commit to fix compilation when zlib is missing.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/0004-configure-zlib.patch | 30 ++++++++++++++++++++++++++++++
>  package/mplayer/mplayer.hash              |  8 ++++----
>  package/mplayer/mplayer.mk                |  2 +-
>  3 files changed, 35 insertions(+), 5 deletions(-)
>  create mode 100644 package/mplayer/0004-configure-zlib.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
