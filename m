From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 00:10:27 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/gstreamer1/gstreamer1-editing-services: disable introspection
In-Reply-To: <20200820183210.775080-1-fontaine.fabrice@gmail.com>
References: <20200820183210.775080-1-fontaine.fabrice@gmail.com>
Message-ID: <20200821001027.6be3cea0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Aug 2020 20:32:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable introspection as it raises a build failure with autotools.
> It could be enabled after bumping to upcoming 1.18.x and switching to
> messon. We can't switch now as version 1.16.2 don't allow to disable
> examples/tools through meson
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/36eb875fba2847b32df05f31d8f8ca9f0ecde36f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../gstreamer1-editing-services.mk                            | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
