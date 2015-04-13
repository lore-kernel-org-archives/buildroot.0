From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 09:43:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 10.5.3
In-Reply-To: <1428904039-23326-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428904039-23326-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150413094335.09359e5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 13 Apr 2015 07:47:19 +0200, Bernd Kuhls wrote:
> Upstream tarball now contains more pre-generated files, therefore we can remove
> dependencies to host-python and host-gettext, quote from
> http://lists.freedesktop.org/archives/mesa-announce/2015-April/000150.html:
> "xmlpool: don't forget to ship the MOS
> configure.ac: error out if python/mako is not found when required"
> 
> Fixes python3-related build error
> http://autobuild.buildroot.net/results/7a5/7a5e53861bce6854265867e6e8525aabffb1d473/
> http://autobuild.buildroot.net/results/ce4/ce45f986c3943b8ced3b15a0ebd1dc03fc7b7dcc/
> http://autobuild.buildroot.net/results/1ce/1ce2509c8abb7483397c7d0f21c299095e94a254/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk |    2 +-
>  package/mesa3d/mesa3d.hash               |    4 ++--
>  package/mesa3d/mesa3d.mk                 |    4 +---
>  3 files changed, 4 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
