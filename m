From: Ormund Williams <ormundw@panix.com>
Date: Fri, 01 Feb 2008 00:36:43 -0500
Subject: [Buildroot] make clean not so clean
In-Reply-To: <214360.55769.qm@web56410.mail.re3.yahoo.com>
References: <214360.55769.qm@web56410.mail.re3.yahoo.com>
Message-ID: <1201844203.3526.46.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-01-31 at 21:02 -0800, jake sullivan wrote:
> I'm not sure how to go about fixing this, but I have been able to
> recreate an annoying little bug (that I think is the source of a
> number of other newb problems).
> 
...(snip)...
> My gut says to update "make clean" to delete all the config files (and
> basically everything but the source files), but before I put work into
> making and testing a patch, I want to make sure that is the right
> approach...
> 
Don't know about "Right Appraach", but I just locate my download
directory outside the Buildroot tree.

Under: Build Options --->

	$(BASE_DIR)/../dl) Download dir


__
Ormund
