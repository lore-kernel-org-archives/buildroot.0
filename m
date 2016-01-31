From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:48:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/mtdev2tuio: fix musl build
In-Reply-To: <1454227703-26416-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454227703-26416-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131234810.73c75b1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 09:08:23 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/aee/aee411047265bf205f8990a3d0d2310decb5fd19/
> http://autobuild.buildroot.net/results/9a9/9a96fdd2b52a75b348b46696c7f8b427f2d987c2/
> http://autobuild.buildroot.net/results/2e1/2e155f2f57fd035362ad1b414f42e1c2b5de844b/
> http://autobuild.buildroot.net/results/f62/f62d3830c594d9169fa9b9df5212f190d676fab9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../mtdev2tuio/0001-Fix-build-with-musl-libc.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/mtdev2tuio/0001-Fix-build-with-musl-libc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
