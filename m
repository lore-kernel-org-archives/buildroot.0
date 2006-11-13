From: MikeW <mw_phil@yahoo.co.uk>
Date: Mon, 13 Nov 2006 16:19:55 +0000 (UTC)
Subject: [Buildroot] Toolchain clean ? rebuild with extra patch
References: <loom.20061109T101231-410@post.gmane.org>
	<20061109100315.GB29635@aon.at>
Message-ID: <loom.20061113T171859-568@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer <rep.nop@...> writes:

> 
> On Thu, Nov 09, 2006 at 09:18:01AM +0000, MikeW wrote:
> >All of the toolchain-build contents persist after make clean, distclean,
> >so which 'clean' variant should be used if you want to rebuild the toolchain ?
> 
> Try make dirclean.
> 

Thanks - that worked.
I expected 'distclean' to scrub back to distribution cleanliness !

Regards,
Mike
