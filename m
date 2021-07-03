From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:12:23 +0200
Subject: [Buildroot] [PATCH] package/at: bump versinon to 3.2.2
In-Reply-To: <20210703221053.590544d9@windsurf>
References: <20210621174419.303865-1-giulio.benetti@benettiengineering.com>
 <20210703221053.590544d9@windsurf>
Message-ID: <20210703221223.4194738d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry, sent too quickly.

On Sat, 3 Jul 2021 22:10:53 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> >  Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> >  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > +[Vincent: tweak the patch for the new version]
> > +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > +[Giulio: rebase to version 3.2.2 and modify IROOT/DESTDIR compability]  
> 
> The author of a commit (i.e the From: line) should always match the *first* Signed-off-by-line.
> 
> > -[PATCH]: Makefile.in: fix make install for non-root, don't strip
> > +From daae0a5a26ad78c05adb0eb1fc6cad1896e3766a Mon Sep 17 00:00:00 2001
> > +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > +Date: Mon, 21 Jun 2021 19:33:23 +0200
> > +Subject: [PATCH] Makefile.in: fix make install for non-root, don't strip

We have the same situation here: please keep the authorship.

Actually, perhaps you should do a preliminary patch that converts all
patches in package/at/ to be Git formatted patches, drop the 5/5 in
package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch, and then
have a patch doing the version bump.

Also minor nit in the commit title: versinon => version.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
