From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 14 Dec 2006 16:29:05 +0100
Subject: [Buildroot] [patch] mpg123 build issues
In-Reply-To: <200612141602.15413.uli@suse.de>
References: <200612141602.15413.uli@suse.de>
Message-ID: <20061214152905.GA1993@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 14, 2006 at 04:02:15PM +0100, Ulrich Hecht wrote:
>Hi!
>
>The current mpg123 package
>
>- ignores TARGET_CC (overwritten in Makefile)
>- ignores TARGET_CFLAGS
>- is hardcoded to use the i386 target
>
>The attached patch fixes these issues.

May i ask you to verify that a) an mpg123 bug exists in the bug-database
and if so b) incooperate possible additional fixes?

TIA,
Bernhard
