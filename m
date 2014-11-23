From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 23 Nov 2014 01:12:39 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: bumped version number to 5.25
Message-ID: <trinity-621b72dd-4362-44df-bbf8-d19c6ffb5953-1416701559591@3capp-gmx-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente, Jaap,

On Fri, Nov 21, 2014 at 05:00:59PM +0000, Vicente Olivert Riera wrote:
> Dear Jaap Crezee,
 
[...]

> Just a few more things for the next time you send patches to Buildroot.
> After sending a new version of a patch, we usually mark the former patch
> as "superseded" in patchwork. To be able to do that, you need to be
> logged in in patchwork. If you don't have an account, you can create one
> here:
> 
> http://patchwork.ozlabs.org/register/
> 

Would be a nice patchwork feature to mark 'legacy' patches automatically
as superseded in case a newer patch (with same subject, new version number,
from same submitter) is detected on the mailing list?

> Another one. When you create the patch using "git format-patch", before
> sending it, please edit the patch using your favourite text editor and
> add the version number in the "Subject" line. Here is an example using
> your own patch:
> 
> Subject: [PATCH v2] bluez5_utils: bumped version number to 5.25
> 

Or use 'git format-patch --subject-prefix "PATCH v2" ...'

Regards,
Peter
