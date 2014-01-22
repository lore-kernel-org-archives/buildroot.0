From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 07:44:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/omxplayer: new package
In-Reply-To: <41b5b8d92e5ef5bb506ec1a316d37423568659e0.1390242867.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 20 Jan 2014 19:37:51 +0100")
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <41b5b8d92e5ef5bb506ec1a316d37423568659e0.1390242867.git.yann.morin.1998@free.fr>
Message-ID: <874n4wfrcq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > OMXplayer uses openMAX on the RPi to play videos with hardware acceleration.

 > Compared to using a gstreamer pipe, OMXplayer uses a complete "tunnel-mode",
 > in which the video is pipped (after demuxing) into the hardware, all the way

s/pipped/piped/

Otherwise it looks good to me.


-- 
Bye, Peter Korsgaard
