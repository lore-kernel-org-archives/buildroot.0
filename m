From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 12:20:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5base: drop wrong
 optimization flag
In-Reply-To: <20190626140412.101607-1-giulio.benetti@micronovasrl.com>
References: <20190626140412.101607-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190803122022.0a67e7dd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jun 2019 16:04:11 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> In qmake.conf.in has been left 'QMAKE_CXXFLAGS_RELEASE += -O3' but this
> leads to not use Buildroot CXXFLAGS when building in release
> mode(without debugging symbols). So let's remove it to let Qt5 to follow
> Buildroot optimization flags like other packages do.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/qt5/qt5base/qmake.conf.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
