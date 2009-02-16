From: Sven Neumann <s.neumann@phase-zero.de>
Date: Mon, 16 Feb 2009 10:20:32 +0100
Subject: [Buildroot] outstanding patches in bugzilla
Message-ID: <1234776032.6303.18.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

just a quick reminder that there are some patches in Bugzilla that were
supposed to be committed after the release. Now would be a good time to
have another look at them and perhaps get them into trunk. Here's a list
of bugs that I consider ready for inclusion, in the order they should
preferably be committed:


tslib puts staging_dir into pkgconfig file
https://bugs.busybox.net/show_bug.cgi?id=61
This bug has a patch that converts tslib to use Makefile.autotools.in.
This fixes a problem with the tslib.pc file.


convert libvorbis to Makefile.autotools.in
https://bugs.busybox.net/show_bug.cgi?id=107
This bug has a patch that converts libvorbis to use
Makefile.autotools.in. This fixes a problem with wrong paths being
written to the libvorbis*.la files.


update libglib2 to version 2.18.4
https://bugs.busybox.net/show_bug.cgi?id=37
Here's a patch to update libglib2 to the latest stable version.
This is a prerequisite for bug 35, see below.


new packages: libsoup, gssdp, gupnp, gupnp-av
https://bugs.busybox.net/show_bug.cgi?id=35
This bug report has a patch that adds the GUPnP stack to buildroot.


update gstreamer packages
https://bugs.busybox.net/show_bug.cgi?id=101
Here's a patch to update the GStreamer packages to the latest stable
releases. It also removes some patches which have been applied upstream.


new package: flac
https://bugs.busybox.net/show_bug.cgi?id=99
libFLAC is a library to handle the free lossless audio codec. The
patches attached to this bug report add the flac package and also add
flac support as an option to gst-plugins-good.


I'd very much appreciate if these patches could go upstream. Thanks.


Sven
