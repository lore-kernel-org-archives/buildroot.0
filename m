From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:53:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/kbd: bump version to 2.0.4
In-Reply-To: <20170724183621.28461-1-bernd.kuhls@t-online.de>
References: <20170724183621.28461-1-bernd.kuhls@t-online.de>
Message-ID: <20170725215316.5651d163@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 20:36:21 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream
> 
> 0001-add-configure-flag-to-disable-tests.patch
> https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=baeb5aa827d956bd06492775dc5bd9f89d394149
> 
> 0002-Link-against-libintl-when-needed.patch
> https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=b08caa2e3db53ea4263d0236c83a0df11a40a569
> 
> Autoreconf is not necessary anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-add-configure-flag-to-disable-tests.patch | 64 ----------------------
>  .../0002-Link-against-libintl-when-needed.patch    | 49 -----------------
>  package/kbd/kbd.hash                               |  2 +-
>  package/kbd/kbd.mk                                 |  3 +-
>  4 files changed, 2 insertions(+), 116 deletions(-)
>  delete mode 100644 package/kbd/0001-add-configure-flag-to-disable-tests.patch
>  delete mode 100644 package/kbd/0002-Link-against-libintl-when-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
