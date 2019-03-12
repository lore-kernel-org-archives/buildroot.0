From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 23:12:25 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-plugins-bad: add zbar
 plugin option
In-Reply-To: <20190309215036.23103-1-ps.report@gmx.net>
References: <20190309215036.23103-1-ps.report@gmx.net>
Message-ID: <20190312231225.07adf487@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 22:50:36 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Note: patch depends on '[PATCH v4] package/zbar: bump version to 0.22'
>       https://patchwork.ozlabs.org/patch/1053876
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in       | 13 +++++++++++++
>  .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk |  8 +++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
