From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 7 Oct 2007 20:20:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:  package
In-Reply-To: <20071007182301.E9647A6AAE@busybox.net>
References: <20071007182301.E9647A6AAE@busybox.net>
Message-ID: <20071007182025.GN20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 07, 2007 at 11:23:01AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-10-07 11:23:01 -0700 (Sun, 07 Oct 2007)
>New Revision: 20196
>
>Log:
>Allow date to be added to Image

The COPYTO is the proper thing to use for this kind of stuff.
Why don't you just use the COPYTO that is already there?
