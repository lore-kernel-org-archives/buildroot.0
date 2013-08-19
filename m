From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 19 Aug 2013 16:44:30 -0500
Subject: [Buildroot] GSoC Weekly Update
Message-ID: <CAEBucnAk9=6HHJr0faO7wGW4xwJR5f14Le+9BXzSQw-0tVTiNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

As some of you may be aware, I am the GSoC student for Buildroot this
Summer. Starting this week, I will be providing weekly updates to the
mailing list with information on my activities.

My main goals for last week were the integration of the glmark2
benchmark into Buildroot.  I'm currently testing this support on many
of the boards (rpi/beaglexm/cubieboard) and will hopefully post these
patches this week.  To get to the glmark2 benchmark a number of
changes were required, specfically a new package for libpng12, a bump
in libdrm, and a bump in mesa3d.  In addition, the mesa3d support was
partially rewritten in order to support a more granular selection of
graphics drivers.  This will allow, future limare/freedreno
integration, which looks very promising (especially freedreno).

Furthermore, this weeks goal is to get both i.MX6 based platforms up
and running.  I currently have both a Wandboard [1] and a SABRE [2]
for testing the imx6 packages in Buildroot.

Thanks,

Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
