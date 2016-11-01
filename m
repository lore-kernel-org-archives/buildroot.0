From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:21:19 +0100
Subject: [Buildroot] [PATCH 1/1] gupnp-tools: fix when using latest
 gupnp-av
In-Reply-To: <1477864053-111298-1-git-send-email-fabrice.fontaine@orange.com>
References: <1477864053-111298-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161101162119.06f3b3d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 22:47:33 +0100, Fabrice Fontaine wrote:
> Include gupnp.h ourselves, gupnp-av.h doesn't drag it in anymore
> 
> Backported from: e9ec9634207e4c2eea6d268ee29b57e687c1f178
> The patch retrieved from the official gnome URL
> (https://git.gnome.org/browse/gupnp-tools/patch/?id=e9ec9634207e4c2eea6d268ee29b57e687c1f178)
> can not be applied through GUPNP_TOOLS_PATCH as it does not end with the
> '.patch*' pattern
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/329851daa060f23c55f996c1b0f323d41f85ccb2
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  ...-Fix-compiling-when-using-recent-GUPnP-AV.patch | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/gupnp-tools/0001-Fix-compiling-when-using-recent-GUPnP-AV.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
