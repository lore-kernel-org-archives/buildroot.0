From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:39:31 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: update configure
 options
In-Reply-To: <1444938163-6487-1-git-send-email-ps.report@gmx.net>
References: <1444938163-6487-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151021233931.63709eff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 15 Oct 2015 21:42:43 +0200, Peter Seiderer wrote:
> - add new onvif option
> - add new dtls option
> - add new openh264 option
> - add new x265 option
> - removed real plugin option
> - add new rtp option
> - remove always disabled legacy options: directdraw, osx_video,
>   quicktime and mythtv
> - add '--disable-bs2b' and '--disable-libde265' to options
>   which require currently unpackaged libraries
> - add '--disable-gtk3' and '--disable-qt'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add legacy entry for removed real option
>   - fix rtp option comment
>   - clarify remove always disabled legacy options (no legacy entry)
>   - disable gtk3/qt for the momment (suggested by Arnout Vandecappelle)
> ---
>  Config.in.legacy                                   |  6 ++++
>  package/gstreamer1/gst1-plugins-bad/Config.in      | 24 +++++++++++--
>  .../gst1-plugins-bad/gst1-plugins-bad.mk           | 41 ++++++++++++++++------
>  3 files changed, 57 insertions(+), 14 deletions(-)

Applied, I've only slightly tweaked the Config.in.legacy option, since
the prompt "real plugin has been removed" was a bit vague.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
