From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 7 Oct 2008 10:43:45 +0200
Subject: [Buildroot] [BR-AVR32] [PATCH] Support for new MIMC200 board
In-Reply-To: <48EB1EDF.6070209@mimc.co.uk>
References: <48EA05EB.7020807@mimc.co.uk> <20081007074128.12613e2c@hcegtvedt>
	<48EB1EDF.6070209@mimc.co.uk>
Message-ID: <20081007104345.59bacec2@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 07 Oct 2008 09:33:35 +0100
Mark Jackson <mpfj@mimc.co.uk> wrote:

> Hans-Christian Egtvedt wrote:
> > On Mon, 06 Oct 2008 13:34:51 +0100
> > Mark Jackson <mpfj@mimc.co.uk> wrote:
> > 
> >> Please consider the following patch which adds support for a new
> >> AVR32 based board.
> >>
> >> The board is closely based on Atmel's NGW100 reference board, but
> >> has an extra 8MByte FLASH and 128KByte FRAM.
> >>
> >> The compressed patch is 66k, so I've stuck it on our website.
> >>
> >> http://www.mimc.co.uk/mimc200-new-board.patch.bz2
> >>
> > 
> > Could you post it in plain text attachment/inline instead? It is a
> > bit hard to comment on a compressed patch file ;)
> 
> Urm ... the patch is about 220k uncompressed.  I thought it was a
> "bad thing" to post such a large patch.
> 
> However, I'm happy to do so if you want !!
> 

Hmm, that was a bit large, yes.

You must split up your patch, it contains far more than just a new
board. Each patch should only add/change one feature in Buildroot.

I would also recommend that you get all the kernel and U-Boot stuff
upstream first, and then go for the Buildroot stuff.

> > Is the patch based on the latest uclibc.org repo or Buildroot for
> > AVR32 release (v2.2.0)?
> 
> The latest svn (actually r23594).
> 

Then it is better if you post it to uclibc.org mailing list, I import
stuff from uclibc.org, so eventually it will end up in my fork() as
well.

-- 
Best regards,
Hans-Christian Egtvedt
