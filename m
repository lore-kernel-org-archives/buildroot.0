From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  8 Jul 2011 15:12:52 +0200
Subject: [Buildroot] add orc package and change gstreamer packages
	accordingly
Message-ID: <1310130778-6359-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

here are the remaining patches that add the orc package and change
the gstreamer packages accordingly. Since the last submission I've
added a host-version of orc (that I have tested in our setup) and
changed the gst-ffmpeg patch to only add the orc dependency.

Please consider to include these patches in buildroot.


Thanks,
Sven
