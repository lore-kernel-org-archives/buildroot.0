From: Ismael Luceno <ismael@iodev.co.uk>
Date: Mon, 25 Sep 2017 14:41:08 -0300
Subject: [Buildroot] [PATCH] axel: bump to version 2.14.1
In-Reply-To: <b676e492-44f5-2498-639e-ee68909d7fee@mind.be>
References: <20170922044545.18813-1-ismael@iodev.co.uk>
 <cf484d3b-ef26-1829-3a09-e98a4253cc16@mind.be>
 <20170925142720.GA25135@pirotess.bf.iodev.co.uk>
 <b676e492-44f5-2498-639e-ee68909d7fee@mind.be>
Message-ID: <20170925174107.GC25135@pirotess.bf.iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/Sep/2017 18:44, Arnout Vandecappelle wrote:
> 
> 
> On 25-09-17 16:27, Ismael Luceno wrote:
> > Thanks for the feedback.
> > 
> > On 24/Sep/2017 16:09, Arnout Vandecappelle wrote:
> > <...>
> >> If upstream has a v in their version, you should also have it. So
> >>
> >> AXEL_VERSION = v2.14.1
> >>
> >> Note that as of today, the github helper no longer requires the third
> >> argument.
> > 
> > The "v" is not part of the version number, so I would prefer to leave it
> > out of AXEL_VERSION...
> 
>  No, the v *is* part of the version number. If you use the github helper, the
> _VERSION variable must be identical to the upstream tag.

Well, that's a matter of interpretation, the project considers it a
prefix, and Github agrees with common practice and removes the "v"
prefix when building the archive...

So if using the github macro, AXEL_VERSION must be a tag or commit id?
