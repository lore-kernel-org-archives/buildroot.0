From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Jan 2012 10:29:58 +0100
Subject: [Buildroot] [PATCH 7/7] sam-ba: new package with host variant
	only
In-Reply-To: <20120113092545.7aac96a8@skate>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
 <201201130013.13601.arnout@mind.be> <20120113092545.7aac96a8@skate>
Message-ID: <201201131029.59067.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 13 January 2012 09:25:45 Thomas Petazzoni wrote:
> Le Fri, 13 Jan 2012 00:13:13 +0100,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
> >  Buildroot is missing post-image scripting in general.  You will
> > typically want to package the kernel and rootfs in a compressed and
> > signed image that can be distributed and installed on the target.  Or
> > during development, you would like to untar it to the nfsroot.
> 
> For one project, I have added a post-image script hook, like we have
> for post-build. I've used it to generate a firmware image in a special
> format, bundling the kernel image and the root filesystem image.
> 
> Does it make sense to submit such a feature?

 It most certainly does.

 Myself, I have already created six scripts like that...  So I guess I'm
better placed to refactor some commonalities out of them :-)  Now if I only
had the time to do it... (I'm still catching up on the buildroot mailing list
of end of December...)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
