From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:06:18 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-devtools: add optional
 gst1-rtsp-server dependency
In-Reply-To: <20201019192757.6624-1-ps.report@gmx.net>
References: <20201019192757.6624-1-ps.report@gmx.net>
Message-ID: <20201025110618.2c032b12@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Oct 2020 21:27:57 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add optional gst1-rtsp-server dependency as checked for in
> gst1-devtools-1.18.0/validate/tools/meson.build.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst1-devtools/gst1-devtools.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
