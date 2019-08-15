From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 23:18:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: fix build without
 qt5serialport
In-Reply-To: <20190815211139.18420-1-fontaine.fabrice@gmail.com>
References: <20190815211139.18420-1-fontaine.fabrice@gmail.com>
Message-ID: <20190815231828.1852a279@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 23:11:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set USE_PLUGIN_TELESCOPECONTROL depending on qt5serialport availability
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/01452113e984de0ddf177a513d20287c96ebe0a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/stellarium/stellarium.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
