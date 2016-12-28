From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Dec 2016 15:32:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-12-24
In-Reply-To: <eaf4dc60-3bef-18e5-237c-1d31cbfaa912@armadeus.com>
References: <20161225072953.0D89E20729@mail.free-electrons.com>
 <eaf4dc60-3bef-18e5-237c-1d31cbfaa912@armadeus.com>
Message-ID: <20161228153254.3f985085@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Buildroot mailing list in Cc. You probably intended to do that,
since you wrote to me in english and not french :)

On Wed, 28 Dec 2016 15:04:21 +0100, Julien Boibessot wrote:

> On 25/12/2016 08:29, Thomas Petazzoni wrote:
> > Hello,
> >
> > This is the list of Buildroot build failures that occured on
> > 2016-12-24, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Build failures related to your packages:
> >
> >          arm |                   ltris-1.0.19 | http://autobuild.buildroot.net/results/d9ad2d0e91ebc232f42a5bfbfdc271e78c05592d
> >  
> 
> seems like the "well known" (?) problem of DirectFB not linked against
> libstdc++ in static build, we already discussed previously this year ?

Yes. Someone needs to submit the patch fixing that :)

I was going to propose to remove DirectFB, since the last commit on
Github dates back from February 2014, and the website
(directfb.org) which has been dead since at least 2015 is now
cyber-squatted. However, it seems like a new website is up at
directfb.net, which a news from November 2016. And it seems like the
Github repo at https://github.com/deniskropp/DirectFB/commits/master
contains some newer updates. Not sure why the upstream maintainer
doesn't use https://github.com/DirectFB/directfb.

But still, I wouldn't call that a really active upstream...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
