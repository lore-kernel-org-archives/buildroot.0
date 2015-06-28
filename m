From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:27:09 +0200
Subject: [Buildroot] [PATCH 1/2] libaio: introduce a
 BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS option
In-Reply-To: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1435241096-23969-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20150628152709.405bce33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Ripard,

On Thu, 25 Jun 2015 16:04:55 +0200, Maxime Ripard wrote:
> In order to allow other packages to easily select mplayer without
> duplicating its complicated architecture dependencies, this commit
> introduces a BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS blind option.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  package/blktrace/Config.in      |  6 +-----
>  package/gadgetfs-test/Config.in |  6 +-----
>  package/libaio/Config.in        | 11 +++++++----
>  3 files changed, 9 insertions(+), 14 deletions(-)

Applied after fixing the 'mplayer' typo in the commit log, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
