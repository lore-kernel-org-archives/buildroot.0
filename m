From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 09:04:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: gl enabled when
 either GL or GLES2 is present
In-Reply-To: <a2716dca-9a75-9c12-3b1a-ee3535d59cab@mind.be> (Arnout
 Vandecappelle's message of "Sat, 12 Oct 2019 00:04:03 +0200")
References: <20190808113631.21408-1-cturner@igalia.com>
 <a2716dca-9a75-9c12-3b1a-ee3535d59cab@mind.be>
Message-ID: <87sgnc5653.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >  Hi Charlie,
 > On 08/08/2019 13:36, Charlie Turner wrote:
 >> When building gst1-plugins-base with GL support on the rpi3 (which
 >> supports only GLES2, not full desktop GL), GStreamer was being asked to
 >> disable its GL support completely. This isn't correct since it can be
 >> used with either GL or GLES2.
 >> 
 >> Signed-off-by: Charlie Turner <cturner@igalia.com>

 >  I *finally* applied to master, thanks.

Committed to 2019.08.x, thanks. 2019.02.x uses an older gstreamer1 /
autotools, so it isn't (directly) applicable.

-- 
Bye, Peter Korsgaard
