From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 08 Oct 2007 00:58:33 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:  package
In-Reply-To: <20071007182025.GN20951@aon.at>
References: <20071007182301.E9647A6AAE@busybox.net>
	<20071007182025.GN20951@aon.at>
Message-ID: <1191797913.29084.29.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-10-07 klockan 20:20 +0200 skrev Bernhard Fischer:
> On Sun, Oct 07, 2007 at 11:23:01AM -0700, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2007-10-07 11:23:01 -0700 (Sun, 07 Oct 2007)
> >New Revision: 20196
> >
> >Log:
> >Allow date to be added to Image
> 
> The COPYTO is the proper thing to use for this kind of stuff.
> Why don't you just use the COPYTO that is already there?

Because I need the CopyTo to copy to /tftpboot,
and I still want to have some king of revision info
so I do not overwrite what is already there.
If something stops working, then I still have older revisions.


If you so dearly want to have it without a date, then it is
easy to create a link without the date.

BR
Ulf Samuelsson
