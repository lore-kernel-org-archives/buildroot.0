From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Feb 2013 21:39:38 +0100
Subject: [Buildroot] [PATCH] gstreamer: ALSA plugin requires threads
	support
In-Reply-To: <1361603043-22539-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Fri, 22 Feb 2013 23:04:03 -0800")
References: <1361603043-22539-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87mwuubw8l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/2782b5ee6af25da9d49d9bc7b950dc2a92fb5bca

Isn't all of gstreamer heavily threaded?

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/multimedia/gst-plugins-base/Config.in |    4 ++++
 Gilles>  1 file changed, 4 insertions(+)

-- 
Bye, Peter Korsgaard
