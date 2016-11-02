From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:28:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 13.0.0
In-Reply-To: <20161101192451.16248-1-bernd.kuhls@t-online.de>
References: <20161101192451.16248-1-bernd.kuhls@t-online.de>
Message-ID: <20161102172817.74ec1828@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 20:24:51 +0100, Bernd Kuhls wrote:
> Udev support was removed upstream:
> https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=13.0&id=f9f7e44c94f7eee4778768adf7afffba6c0581e7
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 4 ++--
>  package/mesa3d/mesa3d.mk                 | 9 +--------
>  3 files changed, 4 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
