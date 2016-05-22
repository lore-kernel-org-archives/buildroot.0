From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:46:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: mark as not
 available on nios2
In-Reply-To: <1463815337-3115-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463815337-3115-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160522214626.21e85a7a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 May 2016 09:22:17 +0200, Bernd Kuhls wrote:
> For technical details see
> https://git.busybox.net/buildroot/commit/package/ffmpeg/Config.in?id=8b58ec016973bee87a4fc1cc99a32b206bdee136
> 
> Fixes
> http://autobuild.buildroot.net/results/bb3/bb3b748a14465a6168917bfbed90b2ff84fbdedf/
> http://autobuild.buildroot.net/results/0ee/0ee3132f4ee6b5f21851f93516e0d0c419b36b1b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/stress-ng/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
