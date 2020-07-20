From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 08:17:56 +0200
Subject: [Buildroot] [PATCH v3] package/gstreamer1/gst1-plugins-good:
 Enable GUDEV for V4L2 if available
In-Reply-To: <20200608000026.4237-1-ezequiel@vanguardiasur.com.ar> (Ezequiel
 Garcia's message of "Sun, 7 Jun 2020 21:00:26 -0300")
References: <20200608000026.4237-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <87lfjer9pn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
 > Video4Linux2 plugins can udev for device probing and monitor.
 > This greatly improves load time and monitoring performance.

 > It also enables hotplug monitoring for cameras.

 > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
 > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
 > ---
 > v3:
 > * Apply the dependency only if V4L2 plugins are enabled
 > v2:
 > * Enable/disable v4l2-gudev explicitly

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
