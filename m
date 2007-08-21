From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 21 Aug 2007 19:46:04 +0200
Subject: [Buildroot] improved per-project dependencies
In-Reply-To: <20070821175648.CE549A610A@busybox.net>
References: <20070821175648.CE549A610A@busybox.net>
Message-ID: <20070821174604.GA19089@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 21, 2007 at 10:56:48AM -0700, aldot at uclibc.org wrote:
>Author: aldot
>Date: 2007-08-21 10:56:47 -0700 (Tue, 21 Aug 2007)
>New Revision: 19624
>
>Log:
>- our dependencies are project specific. First (untested) attempt to take this fact into account.
>  Will need to try to copy eventual pre-existing project-specific deps back
>  to package/config in order not to mess up the corresponding timestamps (to avoid superfluous rebuilds)..

I hope that this didn't break too much, if so please holler.
This will need some further massage. Help (patches) welcome
