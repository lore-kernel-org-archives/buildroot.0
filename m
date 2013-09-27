From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Fri, 27 Sep 2013 09:51:50 -0500
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <OFB62018A9.E1F1612C-ON86257BF3.00517397-86257BF3.005194BE@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton Shotwell <clshotwe@rockwellcollins.com> wrote on 09/27/2013 
09:43:35 AM:

> Subject: [RFC] package: Redownload HEAD packages every build
> 
> Adding a check to remove a downloaded package if the version is 
> HEAD. This causes the package to be re-downloaded with updated 
> software. This feature is very useful during package development.

I apologize for messing up the commit message.  That will be fixed in the 
next version.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130927/bdca5831/attachment.html>
