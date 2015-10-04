From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 11:24:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump to version 11.0.2
In-Reply-To: <1443902393-22284-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443902393-22284-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151004112453.5bf731dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  3 Oct 2015 21:59:53 +0200, Bernd Kuhls wrote:
> Mesa3d 10.6.x is reaching end-of-life:
> http://lists.freedesktop.org/archives/mesa-announce/2015-October/000178.html
> "NOTE: It is anticipated that 10.6.9 will be the final release in the
> 10.6 series. Users of 10.6 are encouraged to migrate to the 11.0 series
> in order to obtain future fixes."
> 
> Run-time testing with Kodi Isengard on an Intel GPU was positive.
> 
> Rebased 0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk                              | 2 +-
>  .../0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch     | 4 ++--
>  package/mesa3d/mesa3d.hash                                            | 4 ++--
>  package/mesa3d/mesa3d.mk                                              | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
