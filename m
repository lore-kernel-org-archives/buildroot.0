From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Mon, 9 Sep 2013 08:40:46 -0500
Subject: [Buildroot] [PATCH 00/10] Enable SELinux Support in Existing
	Packages
In-Reply-To: <20130908182641.06c78a78@skate>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20130908182641.06c78a78@skate>
Message-ID: <OFAE0C3563.5656CD6E-ON86257BE1.004AAF7F-86257BE1.004B2688@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/08/2013 
11:26:41 AM:
 
> Dear Ryan Barnett,
> 
> On Thu, 5 Sep 2013 20:04:14 -0500, Ryan Barnett wrote:
> > This is the second set (of three) of patches to add SELinux support in 

> > buildroot. This patch set adds support for SELinux to existing 
packages
> > in buildroot. This patch set is meant to be a follow-up to Clayton 
> > Shotwell's submission of "SELinux Buildroot Additions".
> > 
> > In order to be able to test build existing packages with SELinux 
support, 
> > Clayton Shotwell's SELinux Buildroot Additions must first be applied.
> 
> Thanks for those patches. I have some specific comments on some of
> them, but I wanted to say that generally speaking, they look good. So
> as soon as the previous patch series (which is a little bit more
> complicated) gets merged, we will be able to merge those ones easily.

I'll fix the patches with your suggestions, however I'll wait to resubmit 
a "v2" of these patch when the first set of SE Linux patches get accepting
into mainline.

Thanks,
-Ryan



Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130909/f4f1e794/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130909/f4f1e794/attachment.gif>
