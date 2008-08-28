From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 28 Aug 2008 10:17:20 +1000
Subject: [Buildroot] MTD-utils version bounce
In-Reply-To: <19179409.post@talk.nabble.com>
References: <19179409.post@talk.nabble.com>
Message-ID: <20080828001719.GA10828@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 27, 2008 at 04:53:01AM -0700, Daniel Laird wrote:
> I would like to bounce the mtd-utils version from 1.1.0 to 1.2.0.  This is
> the latest release and contains many fixes.  However I do not want to do
> this if it breaks stuff for everyone else.
> I am not happy with using a GIT checkout every time.  
> So the question is 
> 1.) Do I bounce version and make makefile like mtd-utils.git
> 2.) Create another mtd target of 1.2.0 

Hi Daniel,

I think the BR2_PACKAGE_MTD_UTILS variant, currently 1.1.0, should be
upgraded to 1.2.0. Only the old 2005/2006 versions need to be kept for
special reasons[*].

You probably need some of the Makefile changes/patches from my
mtd-utils.git package.

[*] I don't know what those reasons are, and if they are still valid. If
they are, mtd-utils upstream should be informed so they can be fixed.

thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
