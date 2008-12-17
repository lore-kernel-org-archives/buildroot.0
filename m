From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 17 Dec 2008 10:51:12 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/hotplug
In-Reply-To: <9305ca410812170140r1bf63f0ereb8ad96246740e7b@mail.gmail.com>
References: <20081217063220.1F58D3C682@busybox.net>
	<9305ca410812170140r1bf63f0ereb8ad96246740e7b@mail.gmail.com>
Message-ID: <200812171051.12956.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 17.12.2008:
> On Wed, Dec 17, 2008 at 7:32 AM,  <hamish@uclibc.org> wrote:
> > Author: hamish
> > Date: 2008-12-16 22:32:19 -0800 (Tue, 16 Dec 2008)
> > New Revision: 24436
> >
> > Log:
> > Revert $(strip ...) change which corrupted this file
> 
> Argh, sorry about that - Seems like sed went a bit over board :/

These files are also affected:

   trunk/buildroot/package/openswan/linux-2.6.20-openswan-2.4.7.kernel-2.6-klips.patch
   trunk/buildroot/package/openswan/linux-2.6.20.4-openswan-2.4.7.kernel-2.6-klips.patch
   trunk/buildroot/package/openswan/linux-2.6.21.5-openswan-2.4.8.kernel-2.6-klips.patch
   trunk/buildroot/package/openswan/linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch

And it seems that the openswan directory contains several outdated
patches.

Markus
