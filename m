From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 29 Sep 2011 21:11:52 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: bump version
In-Reply-To: <20110929190334.639708DAC7@busybox.osuosl.org>
References: <20110929190334.639708DAC7@busybox.osuosl.org>
Message-ID: <1317323512.31793.3.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

the audioparsers plug-in has moved to gst-plugins-good. You already
added the option there, but as far as I can see, you did not remove it
in gst-plugins-bad.

Actually I also started to work on this update and I think there are
some more changes to the options needed to give enough control over what
plug-ins are built. Do you have other gstreamer related changes in the
queue or should I have a look and send patches?


Regards,
Sven
