From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:27:45 +0100
Subject: [Buildroot] [RFC v1] package/gst1-plugins-bad: add webrtcbin
 option
In-Reply-To: <20190310175109.13444-1-ps.report@gmx.net>
References: <20190310175109.13444-1-ps.report@gmx.net>
Message-ID: <20190312222745.06cf1b34@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Arnout in Cc, our Config.in.legacy/backward-compatibility guru.

On Sun, 10 Mar 2019 18:51:09 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - just compile tested yet
>   - named webrtcbin option (instead of webrtc), because of the
>     BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC entry in Config.in.legacy
>     (see [1] for history)

Would it be a big problem to reuse the
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC option ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
