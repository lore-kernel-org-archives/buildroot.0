From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 1 May 2016 22:49:36 +0200
Subject: [Buildroot] [PATCH v6 1/3] barebox: prepare for auxiliarry build
In-Reply-To: <20160501143435.72ceddb1@free-electrons.com>
References: <cover.1461531859.git.pieter@boesman.nl>
 <b6c4ffc91b5a5032205af39e2eaff3f536c7e266.1461531859.git.pieter@boesman.nl>
 <20160501143435.72ceddb1@free-electrons.com>
Message-ID: <20160501204936.GC32055@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 01, 2016 at 02:34:35PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Apr 2016 23:15:23 +0200, Pieter Smith wrote:
> > No functional changes. In preparation for the auxiliary barebox build,
> > boot/barebox is split into two parts:
> > 1. boot/barebox:
> >    - The source and patch specification which are to be shared between the
> >      barebox and barebox-aux packages.
> >    - The barebox-package function and build logic.
> > 2. boot/barebox/barebox:
> >    - The package configuration, fragments, barebox env, etc.
> >    - The actual barebox package make instantiation.
> > 
> > Signed-off-by: Pieter Smith <pieter@boesman.nl>
> > ---
> >  boot/barebox/Config.in            | 67 +--------------------------------------
> >  boot/barebox/barebox.mk           |  3 +-
> >  boot/barebox/barebox/Config.in    | 65 +++++++++++++++++++++++++++++++++++++
> >  boot/barebox/barebox/barebox.hash |  1 +
> >  boot/barebox/barebox/barebox.mk   |  8 +++++
> >  5 files changed, 76 insertions(+), 68 deletions(-)
> >  create mode 100644 boot/barebox/barebox/Config.in
> >  create mode 120000 boot/barebox/barebox/barebox.hash
> >  create mode 100644 boot/barebox/barebox/barebox.mk
> 
> Applied to master, thanks.

Thanks as well.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards,
Pieter
