From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 23:02:11 +0200
Subject: [Buildroot] simicsfs 1.18 does not build with kernel 4.12.2
In-Reply-To: <CANQCQpY+iyQ5XtTA5tCh9V9awNa4fhGzJ+bmBdY1YWODuxjppQ@mail.gmail.com>
References: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
 <20170824193354.782bae38@windsurf>
 <CANQCQpY+iyQ5XtTA5tCh9V9awNa4fhGzJ+bmBdY1YWODuxjppQ@mail.gmail.com>
Message-ID: <20170824230211.4c0ea814@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Aug 2017 12:50:20 -0500, Matthew Weber wrote:

> > Unfortunately, simicsfs is no longer available at
> > http://download.simics.net/pub/simicsfs-1.18.tar.gz, where Buildroot
> > currently downloads it. The build only succeeds because we have a
> > backup of this tarball at http://sources.buildroot.net.
> 
> The project I originally did the 1.18 integration on completed ~2yrs
> back and my access to WindRiver Simics material is now gone.  It's too
> bad they didn't keep this driver public, however you may check with
> your WindRiver Simics contacts to see if they just moved the site and
> you could propose an update to this Buildroot package fixing support.

To be honest, since the source code is no longer available online, I'm
not sure it's really worth keeping this package in Buildroot. Let's see
if Bin gets some feedback from Windriver about putting the tarball back
online, publicly available. If there is no feedback, we'll drop the
package I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
