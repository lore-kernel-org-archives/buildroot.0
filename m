From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 18:45:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-base: fix build
 with NLS
In-Reply-To: <20190711165744.8939-1-fontaine.fabrice@gmail.com>
References: <20190711165744.8939-1-fontaine.fabrice@gmail.com>
Message-ID: <20190720184508.449de733@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Jul 2019 18:57:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/93b58753071dac193881049c79288ef39fa9db16
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
