From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 18:45:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: fix build with NLS
In-Reply-To: <20190711165655.8850-1-fontaine.fabrice@gmail.com>
References: <20190711165655.8850-1-fontaine.fabrice@gmail.com>
Message-ID: <20190720184500.536898a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jul 2019 18:56:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/6d3be9feb301495b079eff6283f1cbed9603dc42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gstreamer1/gstreamer1.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
