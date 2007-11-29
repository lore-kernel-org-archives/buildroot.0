From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Thu, 29 Nov 2007 07:30:08 -0600
Subject: [Buildroot] uClibc-nptl?
In-Reply-To: <691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
Message-ID: <20071129133008.GB20914@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Has anyone gotten uClibc-nptl working with buildroot? Particularly on  
> the ARM arch.
> 
The uClibc-NPTL patches for ARM have been posted to the list. They are
not currently in trunk, but will get there in the next couple of weeks.
For now, you could get those patches, and create a tarball of the uClibc
code and call it 'uClibc-snapshot.tar.bz2'. Next, create the directory
'dl' in your buildroot tree and copy that tarball in there. Finally,
select uClibc snapshot from the toolchain configuration menu and you
should be set.

-Steve
