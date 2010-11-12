From: Igor Serebryany <igor47@moomers.org>
Date: Thu, 11 Nov 2010 19:27:44 -0600
Subject: [Buildroot] new way to rebuld just the target root?
In-Reply-To: <20101112005454.GZ8311@moomers.org>
References: <20101112005454.GZ8311@moomers.org>
Message-ID: <20101112012744.GA8311@moomers.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

addendum: i can see that packages often have a .stamp_target_installed
file, and I wouldn't mind going through and deleting all of those, but
how do i get the entire target directory re-created, including copying
from skeleton?

--igor

On Thu, Nov 11, 2010 at 06:54:54PM -0600, Igor Serebryany wrote:
> hi, 
> 
> 	i've asked this question before, but it seems the structure of the
> 	buildroot output directories has changed since I last upgraded. 
> 
> 	using 2009.08, i would do the following to have buildroot rebuild
> 	ONLY the target filesystem:
> 
> 	* remove everything in project_build_*arch*/*myname*/autotools-stamps
> 	* remove the project_build_*arch*/*myname*/root directory
> 	* remove the project_build_*arch*/*myname*/.root file
> 
> 	however, this directory structure doesn't exist anymore, and just
> 	removing 'output/target' and 'output/staging' doesn't seem to
> 	work/causes problems.
> 
> 	is there a new way to rebuild JUST the target filesystem? 
> 
> --igor
> 



> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101111/7dd1c7d5/attachment.pgp>
