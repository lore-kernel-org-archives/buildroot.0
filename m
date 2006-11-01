From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 1 Nov 2006 15:46:32 +0000 (UTC)
Subject: [Buildroot] Persistent tarball repository
References: <loom.20061101T151612-639@post.gmane.org>
	<1162394701.2945.4.camel@iridium.gnat.ca>
Message-ID: <loom.20061101T164136-413@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathanael D. Noblet <nathanael@...> writes:

> 
> On Wed, 2006-11-01 at 14:23 +0000, MikeW wrote:
> > I found to my annoyance that 'make distclean' clears out
 your downloaded .tar.gz
> > files in /dl, which could be a pain if you hadn't realised
 that (and was, since
> > there appears to be a problem with ftp.kernel.org
 so I got the file 'manually')
> > 
> > May I ask if there is a setting to allow these files
 to be cached somewhere that
> > 'distclean' doesn't clear out ?
> > Might also be useful on a server in a team environment
 to ensure everyone
> > uses the same reference downloads without local duplication
 and time penalty.
> 
> make clean?

Yes, but 'make clean' only removes object files, causing a straight rebuild from
source, 'distclean' is supposed to remove any make-generated/config files as
well - IIRC.

Which is not quite the same as deleting all your patiently downloaded
tarballs as well !

So I just wondered if there was a way to either allow distclean to spare
the package source files, or alternatively, if you could 'get' from a
local repository rather than having to download via FTP/HTTP, if your
required file existed.

Regards,
MikeW
