From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 23:47:53 +0100
Subject: [Buildroot] [PATCH] openjpeg: refresh patches
In-Reply-To: <15d0ff6af38ff41acb2129a619e49a0e3ba866d9.1479160710.git.baruch@tkos.co.il>
References: <15d0ff6af38ff41acb2129a619e49a0e3ba866d9.1479160710.git.baruch@tkos.co.il>
Message-ID: <20161114234753.1fc44ab7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 23:58:30 +0200, Baruch Siach wrote:
> The 2.1.2 version bump did not take into account the recently added fixes.
> Update the patches to apply based on upstream pull requests #866 and #867.
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...tiff-append-flags-found-by-pkg-config-if-.patch | 60 +++++++++++-----------
>  ...lcms2-append-flags-found-by-pkg-config-if.patch | 38 +++++++-------
>  2 files changed, 50 insertions(+), 48 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
