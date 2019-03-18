From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:19:16 +0100
Subject: [Buildroot] [PATCH v2] package/gst1-plugins-bad: add webrtc
 option
In-Reply-To: <20190316221440.24465-1-ps.report@gmx.net>
References: <20190316221440.24465-1-ps.report@gmx.net>
Message-ID: <20190318221916.71f326de@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 23:14:40 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove old webrtc Config.in.legacy entry introduced by [1] (misnamed
>   webrtc option was introduced with 2017.02, renamed to webrtcdsp for
>   2017.08 and although backported to 2017.02.4)
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=4c06d2490a07f0b88f42c56c7409899fd2f5608a
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - renamed option form webrtcbin to webrtc
>   - remove legacy webrtc Config.in.legacy entry
> ---
>  Config.in.legacy                                      | 10 ----------
>  package/gstreamer1/gst1-plugins-bad/Config.in         | 11 +++++++++++
>  .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   |  7 +++++++
>  3 files changed, 18 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
