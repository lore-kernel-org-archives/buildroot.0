From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:09:32 +0100
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-bad: drop
 bogus select
In-Reply-To: <20191213151229.1366284-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 13 Dec 2019 16:12:28 +0100")
References: <20191213151229.1366284-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sglbwjib.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > BR2_PACKAGE_WEBRTC does not exist, and we already select
 > BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING, which is the package really
 > needed by the webrtcdsp plugin.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
