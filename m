From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Fri, 1 Feb 2008 03:34:17 -0500 (EST)
Subject: [Buildroot] make clean not so clean
In-Reply-To: <1201844203.3526.46.camel@localhost.localdomain>
References: <214360.55769.qm@web56410.mail.re3.yahoo.com>
	<1201844203.3526.46.camel@localhost.localdomain>
Message-ID: <alpine.LFD.1.00.0802010333120.8154@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 1 Feb 2008, Ormund Williams wrote:

> On Thu, 2008-01-31 at 21:02 -0800, jake sullivan wrote:
> > I'm not sure how to go about fixing this, but I have been able to
> > recreate an annoying little bug (that I think is the source of a
> > number of other newb problems).
> >
> ...(snip)...
> > My gut says to update "make clean" to delete all the config files (and
> > basically everything but the source files), but before I put work into
> > making and testing a patch, I want to make sure that is the right
> > approach...
> >
> Don't know about "Right Appraach", but I just locate my download
> directory outside the Buildroot tree.
>
> Under: Build Options --->
>
> 	$(BASE_DIR)/../dl) Download dir

to save me the trouble of pawing through the source, if you override
the default download directory (of "dl"?), does that mean a "make
distclean" will leave all the downloads alone?  thanks.

rday
--
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
========================================================================
