From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Mar 2019 18:33:51 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix webrtc option
In-Reply-To: <1552200637682-0.post@n4.nabble.com>
References: <20170704113141.2D5C67FCBD@busybox.osuosl.org>
 <87lgo419uv.fsf@dell.be.48ers.dk>
 <1552200637682-0.post@n4.nabble.com>
Message-ID: <20190310183351.289eacb4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello fancychao,

On Sun, 10 Mar 2019 00:50:37 -0600 (CST), fancychao <fanchao@fastmail.com> wrote:

> Hi,
> 
> Sorry if I read this wrong: it seems like webrtcdsp and webrtc are different
> plugin. I was looking for the webrtcbin element in the latest rootfs but it
> didn't exist. Do you know if this change has removed the webrtc plugin?

No, this bulildroot commit (for gstreamer-1.10.x) predates the introduction
of the new webrtc/webrtcbin plugin (since gstreamer-1.14.x, see [1]).

A new buildroot gst1-plugins-bad option for it is missing...

Regards,
Peter

[1] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=1894293d6378c69548d974d2965e9decc1527654

> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
