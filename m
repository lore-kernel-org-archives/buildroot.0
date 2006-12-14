From: Ulrich Hecht <uli@suse.de>
Date: Thu, 14 Dec 2006 17:22:16 +0100
Subject: [Buildroot] [patch] directfb URL
In-Reply-To: <20061214153540.GA2094@aon.at>
References: <200612141623.28760.uli@suse.de> <20061214153540.GA2094@aon.at>
Message-ID: <200612141722.16866.uli@suse.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Thursday 14 December 2006 16:35, Bernhard Fischer wrote:
> On Thu, Dec 14, 2006 at 04:23:28PM +0100, Ulrich Hecht wrote:
> >0.9.25.1 has been moved to Old.
>
> And anyone who touches this, please also check that it gets passed the
> proper flags (the staging-dir libs, not the host ones..)
> http://bugs.busybox.net/view.php?id?9

This patch makes directfb build and fixes #959 and similar issues.

- fixes prefix for libsysfs and libpng so that correct .la files are 
being generated
- same for directfb, plus moves it from $(STAGING_DIR)/usr to 
$(STAGING_DIR)
- fixes PAGE_SIZE issue in directfb

CU
Uli
-------------- next part --------------
A non-text attachment was scrubbed...
Name: directfb.patch
Type: text/x-diff
Size: 4146 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061214/57c7c124/attachment.bin 
