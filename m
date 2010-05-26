From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 May 2010 23:21:57 +0200
Subject: [Buildroot] gst-plugins-base alsa dependency
In-Reply-To: <AB12B32E73474741A2C5361C433A44DE01CA6D85@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	(Phil Edworthy's message of "Wed, 26 May 2010 10:57:56 +0100")
References: <AB12B32E73474741A2C5361C433A44DE01CA6D85@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
Message-ID: <874ohunytm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Edworthy <Phil.Edworthy@renesas.com> writes:

 Phil> Hi,

 Phil> A lot of the GStreamer plugins are built or not based on whether
 Phil> other packages are on the target. For example, gst-plugins-base
 Phil> only builds the alsa plugins if it can find alsa-lib. A clean
 Phil> build means these plugins aren?t built due to the build
 Phil> order. However, if I rebuild gst-plugins-base afterwards, they
 Phil> are built.

Thanks, I've just committed a patch that does this to git.

-- 
Bye, Peter Korsgaard
