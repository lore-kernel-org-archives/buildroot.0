From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 6 Oct 2006 14:26:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <200609301751.27740.rob@landley.net>
References: <20060928125126.53942485A4@busybox.net>
	<200609301751.27740.rob@landley.net>
Message-ID: <20061006122630.GA7163@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 30, 2006 at 05:51:27PM -0400, Rob Landley wrote:
>On Thursday 28 September 2006 8:51 am, aldot at uclibc.org wrote:
>> Author: aldot
>> Date: 2006-09-28 05:51:25 -0700 (Thu, 28 Sep 2006)
>> New Revision: 16248
>> 
>> Log:
>> - add possibility to use a 2.6.18 (full) kernel tarball for the 
>libc-headers.
>
>Where does "make headers_install" get called?

Yes, that's better. Should we build an unifdef-host binary or rely on
the user to have it installed?

Currently testing headers_install, will commit soon.
PS:
Sorry for the delay..
