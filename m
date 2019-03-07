From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:10:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-plugins-bad: allow static
 build of zbar plugin
In-Reply-To: <20190305222807.18393-1-fontaine.fabrice@gmail.com>
References: <20190305222807.18393-1-fontaine.fabrice@gmail.com>
Message-ID: <20190307221055.6f5636ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Mar 2019 23:28:07 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zbar can be built statically since commit
> fc4a6abfa6bbffeabefb9967dbf378c410fb6318 so remove the dynamic library
> dependency from BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer/gst-plugins-bad/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
