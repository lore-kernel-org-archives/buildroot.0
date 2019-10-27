From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 22:58:05 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-10-24
In-Reply-To: <d3c68ac1-d14f-6b4e-5dc2-1f424c0412c3@benettiengineering.com>
References: <20191025061750.1CDB387FC3@hemlock.osuosl.org>
 <20191026195327.6083a565@windsurf.home>
 <d3c68ac1-d14f-6b4e-5dc2-1f424c0412c3@benettiengineering.com>
Message-ID: <20191027225805.4e2c538d@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 22:10:23 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > This build failure is currently happening only on your machine:
> > 
> >    http://autobuild.buildroot.net/?reason=host-icu-64-2
> > 
> > Could you do some analysis of what's going on ?  
> 
> Basically there was not python3 distutils package installed, so i've 
> worked around it by installing it with:
> sudo apt install python3-distutils
> as referenced here:
> https://github.com/Homebrew/linuxbrew-core/issues/12680

Wait, wait, that is weird. distutils is part of the Python standard
library, so why is it provided as a separate package ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
