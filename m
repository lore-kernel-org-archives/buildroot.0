From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 15 Mar 2009 16:51:28 +0100
Subject: [Buildroot] [PATCH] vim: fix download of patches
In-Reply-To: <87prgirj0o.fsf@macbook.be.48ers.dk>
References: <20090309194755.9831D764AC@busybox.osuosl.org>
	<200903151239.24015.markus.heidelberg@web.de>
	<87prgirj0o.fsf@macbook.be.48ers.dk>
Message-ID: <200903151651.28571.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 15.03.2009:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
> Hi,
> 
>  >> Log:
>  >> vim: fixup patch download location after change to DOWNLOAD macro.
> 
>  Markus> Didn't work after this commit if the vim patches weren't yet
>  Markus> available as dl/7.1.*, but still in dl/vim/7.1.*
> 
> Ahh yes, thanks. I committed as slightly different version as r25662 (I
> didn't like a catch-all DL_DIR/% rule).

Oh, yes, that wasn't really nice.

Markus
