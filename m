From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 12:14:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to
 1.5.0
In-Reply-To: <1469869822-19130-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469869822-19130-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160730121414.13591484@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jul 2016 11:10:22 +0200, Bernd Kuhls wrote:
> Bumping to 1.6.0 is not possible atm because ffmpeg fails to compile
> with it. Patches to solve the problem were committed to ffmpeg master:
> 
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=293676c476733e81d7b596736add6cd510eb6960
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=c5d326f551b0312ff581bf1df35b21d956e01523
> 
> Backporting fails so let's just wait for the next ffmpeg bump to bump
> libopenh264 as well.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libopenh264/libopenh264.hash | 2 +-
>  package/libopenh264/libopenh264.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
