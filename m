From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 23:40:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/xserver_xorg-server: disable
 unit tests
In-Reply-To: <20190409200448.25660-1-fontaine.fabrice@gmail.com>
References: <20190409200448.25660-1-fontaine.fabrice@gmail.com>
Message-ID: <20190409234045.3f5f9f5b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Apr 2019 22:04:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/95a5004c9245f1f90758631b02e17d3df12812ec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
