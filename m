From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 6 Sep 2013 13:07:44 -0500
Subject: [Buildroot] [PATCH 00/17] SELinux Buildroot Additions
In-Reply-To: <20130906194903.28c020ba@skate>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <20130906194903.28c020ba@skate>
Message-ID: <OF299770B9.9F574639-ON86257BDE.00636F06-86257BDE.006395D0@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Clayton and I have been going back and forth on how best to do this, as 
the next set of patch that we want to release provides information on 
SELinux.
You had provided feedback to Clayton on options for providing this 
information
and I think it was agreed upon that the manual will be the best place for 
this. 
Is this correct?

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/06/2013 
12:49:03 PM:

 
> Dear Clayton Shotwell,
> 
> On Wed, 4 Sep 2013 18:09:39 -0500, Clayton Shotwell wrote:
> > Submitting an initial patch set to add SELinux support to Buildroot.
> > This patch set adds packages required for an SELinux system along with
> > the packages needed to build them.
> 
> Thanks Clayton for these patches. They are definitely interesting, but
> as you've seen they are also quite big and therefore will take a bit of
> time to review and get merged.
> 
> In order to ease the review process, would it be possible to get a
> short introduction to SELinux, and especially what tools are needed on
> the host, what tools are needed on the target? I'm especially
> interested in understanding why/if we need all this Python stuff on the
> target.

I believe the best way to answer to questions above about is add to the 
manual.
As this way that we won't have to necessarily duplicate work (and 
motivates us
to create the documentation). So hopefully by the middle of the week next 
week
we can submit some documentation.

Where would you like this documentation placed? Also how does one go about 
adding
to the manual (I can't seem to find anything in the manual)? Or do we want 
to place
this information on the buildroot wiki?

> 
> So essentially, having an overview of the patch series would be nice:
> what the various packages are doing (you can skip the basic stuff like
> ustr), and how they "interact" with each other.
> 
> Thanks a lot again for this contribution!




Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/6b51d6f2/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/6b51d6f2/attachment-0001.gif>
