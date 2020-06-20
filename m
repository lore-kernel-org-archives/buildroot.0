From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:47:43 +0200
Subject: [Buildroot] [PATCH v2 7/7] package/qt5: Enable cups support
 when BR2_PACKAGE_CUPS
In-Reply-To: <20200619145719.2352019-8-angelo@amarulasolutions.com>
References: <20200619145719.2352019-1-angelo@amarulasolutions.com>
 <20200619145719.2352019-8-angelo@amarulasolutions.com>
Message-ID: <20200620224743.3752cf5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jun 2020 16:57:19 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Cups support in QT should be enable if CUPS is available system wide.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
