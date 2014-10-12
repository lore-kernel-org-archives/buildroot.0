From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 17:37:29 +0200
Subject: [Buildroot] glmark2 and mesa3d-demos
Message-ID: <20141012173729.0a6a883e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

Since you are our OpenGL/X.org guy, I wanted to know if you could be
interested by taking over the glmark2 and mesa3d-demos patches. As you
probably know those are OpenGL test programs, that could be interesting
to have in Buildroot test/check the OpenGL installation.

Historically, those patches were written by Spenser Gilliland, as part
of GSoC 2013. Unfortunately, they were not merged as a few issues
remained, and the GSoC ended before Spenser could provide a
mainline-acceptable solution. As part of the GSoC 2014, Hadrien also
tried to push this a bit further, but ran into issues.

Would you be interested in picking up those patches?

Here are the patchwork URLs:

  http://patchwork.ozlabs.org/patch/278304/
  http://patchwork.ozlabs.org/patch/278305/

Note that one of them depended on a specific (older) version of libpng,
so there were also other patches related to libpng
(http://patchwork.ozlabs.org/patch/278300/ and
http://patchwork.ozlabs.org/patch/278301/). Maybe a more recent version
of glmark2 or mesa3d-demos will use the more recent libpng API, and
therefore avoid the dependency on a specific version of libpng.

I'll mark the patches as "Changes Requested" in patchwork in the mean
time, hoping that you'll accept to take over them.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
