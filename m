From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:00:55 +0200
Subject: [Buildroot] [PATCH] qt-webkit-kiosk: bump to version
 1.99.6-8-g26e3085
In-Reply-To: <20170824205007.2329-1-jerome.oufella@savoirfairelinux.com>
References: <20170824205007.2329-1-jerome.oufella@savoirfairelinux.com>
Message-ID: <20170824230055.28dfcd75@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Aug 2017 16:50:07 -0400, J?r?me Oufella wrote:
> This bumps the package from 1.99.3 to 1.99.6 (stability fixes), plus a
> few documentation changes and a fix for the build issue logged at [1].
> 
> [1] http://autobuild.buildroot.net/results/9ac/9acb15f955b8af31a3beeb0bd84c4b0db495e354/
> 
> Signed-off-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
> ---
>  package/qt-webkit-kiosk/qt-webkit-kiosk.hash | 2 +-
>  package/qt-webkit-kiosk/qt-webkit-kiosk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Since it fixes a build failure spotted by the autobuilders, I've
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
