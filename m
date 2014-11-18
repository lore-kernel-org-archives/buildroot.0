From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:15:18 +0100
Subject: [Buildroot] [PATCH 1/3] live555: use upstream install target
 for staging installation
In-Reply-To: <83acc63ec240a462958adbc5bdcfea13758768d5.1416212296.git.baruch@tkos.co.il>
References: <83acc63ec240a462958adbc5bdcfea13758768d5.1416212296.git.baruch@tkos.co.il>
Message-ID: <20141118231518.06b925e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 17 Nov 2014 10:18:14 +0200, Baruch Siach wrote:
> Move include directories out of $(STAGING_DIR)/usr/include/live. This is
> upstream choice, and is consistent with e.g. Debian. Update mplayer and vlc to
> match.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/live555/live555.mk | 21 ++-------------------
>  package/mplayer/mplayer.mk |  2 +-
>  package/vlc/vlc.mk         |  9 ++++-----
>  3 files changed, 7 insertions(+), 25 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
