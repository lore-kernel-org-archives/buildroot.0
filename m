From: Mats Erik Andersson <mats.andersson64@comhem.se>
Date: Wed, 16 May 2007 13:58:34 +0200
Subject: [Buildroot] no gcc in rootfs.i386.ext2
In-Reply-To: <20070516110226.GC6566@aon.at>
References: <464AC2D4.9080306@belkam.com>  <20070516110226.GC6566@aon.at>
Message-ID: <1179316714.9676.2.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-05-16 klockan 13:02 +0200 skrev Bernhard Fischer:
> On Wed, May 16, 2007 at 01:37:40PM +0500, Dmitry Melekhov wrote:
> >Hello!
> >
> >Sorry, I'm newbie.
> >I want get root with gcc installed, gcc is compiled OK, but there is no
> >gcc in rootfs.i386.ext2.
> >What can be wrong?
> >btw, I use yesterday svn...
> 

It should be

   Package selection for the target -->

       native toolchain in the target filesystem


although I never used it so far.

Regards,   Mats Erik Andersson
