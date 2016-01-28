From: Marc Leclerc <mleclerc@signel.ca>
Date: Thu, 28 Jan 2016 07:26:27 -0500
Subject: [Buildroot] Information on X front end
Message-ID: <023701d159c7$1c5806f0$550814d0$@signel.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,

First thanks to Thomas for pointing out that user question were welcome on
this list, I wasn't sure either, and thanks to the team who maintain
buildroot.

I have been using buildroot for a while now and it really made my life
easier. Today I would need it to go one step further and provide a working X
frontend that would work on a 7" touch screen and I have basically zero
experience on making that happen. The need here is to run a local gui to our
device. I gave it a few try and got some xterm going but am missing the rest
of the road. I have also found a few how-to but they are outdated and often
about deprecated packages.

So hopefully someone on this mailing list may have some insight to share or
a link I missed. I had hope that ldxe would be part of buildroot but any
frontend that is stable and will run gtk2 apps would do (in my case I'm
giving lazarus a try since I already have some Delphi code that works for
the gui). To top with a cherry, calibration for the screen and a virtual
keyboard would be nice :)

The board I use (Toradex Colibri iMX6DL) comes with a Yocto/lxde image on it
but swimming in Yocto for a while trying to customize it to our need got me
right back to buildroot, where in a few hour I have a fully configured os,
less the gui.

 I am using version 2015.8.1 and as mentioned working on a Toradex Colibri
iMX6DL board

Best Regards
