From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 07 May 2014 16:42:51 +0800
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <20131111215435.GC3510@free.fr>
References: <20131111215435.GC3510@free.fr>
Message-ID: <5369F20B.5030903@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

> We would like to suggest that the web GUI and the pwclient CLI both
> display such tags besides each patch, a bit like (hypotetical output of
> pwclient):

OK, I have some progress on this one; but wanted to make sure what I'm
doing is in the direction that'd be generally useful for you.

How's this look?

  http://ozlabs.org/~jk/tmp/patchwork-ART.png

- there are title attributes on the column header, so you get a tooltip
saying "Acked-by / Reviewed-by / Tested-by" when hovering over it. The
actual numbers have specific tooltips too (eg, "2 Acked-by").

Also, are you wanting to filter by the presence of these tags? Just
non-zero? How about sorting?

Anyone have objections to adding a small column to the default patch
lists? Does anyone want to *not* have this information present?

Cheers,


Jeremy
