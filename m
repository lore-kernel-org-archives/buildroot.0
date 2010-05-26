From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Wed, 26 May 2010 10:57:56 +0100
Subject: [Buildroot] gst-plugins-base alsa dependency
Message-ID: <AB12B32E73474741A2C5361C433A44DE01CA6D85@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

A lot of the GStreamer plugins are built or not based on whether other
packages are on the target. For example, gst-plugins-base only builds the
alsa plugins if it can find alsa-lib. A clean build means these plugins
aren't built due to the build order. However, if I rebuild gst-plugins-base
afterwards, they are built.

 

How can a Buildroot package be told of build order dependencies, without
requiring the packages to be included?

 

Thanks

Phil

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100526/486e49ac/attachment.html>
