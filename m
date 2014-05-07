From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 May 2014 10:56:24 +0200
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <5369F20B.5030903@ozlabs.org>
References: <20131111215435.GC3510@free.fr>
	<5369F20B.5030903@ozlabs.org>
Message-ID: <20140507105624.3ecaaeb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Wed, 07 May 2014 16:42:51 +0800, Jeremy Kerr wrote:

> OK, I have some progress on this one; but wanted to make sure what I'm
> doing is in the direction that'd be generally useful for you.
> 
> How's this look?
> 
>   http://ozlabs.org/~jk/tmp/patchwork-ART.png
> 
> - there are title attributes on the column header, so you get a tooltip
> saying "Acked-by / Reviewed-by / Tested-by" when hovering over it. The
> actual numbers have specific tooltips too (eg, "2 Acked-by").

This looks good! I actually made an implementation of this when I was
in the plane to the US a week ago, but I didn't had the necessary setup
to test it. Glad to see you've done it :)

> Also, are you wanting to filter by the presence of these tags? Just
> non-zero? How about sorting?

Sorting would be useful. I guess sorting for each tag is a bit too
much, so maybe sorting by the total of A+R+T is sufficient.

> Anyone have objections to adding a small column to the default patch
> lists? Does anyone want to *not* have this information present?

On Buildroot's side, we wanted this feature, so we're not really
interested in being able to disable it. But maybe some other projects
do not need it, indeed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
