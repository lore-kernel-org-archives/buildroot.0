From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2011 21:45:19 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version,
	tarball, git and patch dir
In-Reply-To: <20110922205759.01de08f3@skate>
References: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
 <201109221920.37170.arnout@mind.be> <20110922205759.01de08f3@skate>
Message-ID: <201109222145.19265.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thursday 22 September 2011 20:57:59, Thomas Petazzoni wrote:
> Le Thu, 22 Sep 2011 19:20:36 +0200,
> 
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> >  Do people often use buildroot this way?  I always make a
> >
> > project-specific branch of the buildroot tree and drop any patches
> > directly in there.
> 
> I typically make a per-project branch as well, but for kernel/u-boot
> patches, I typically like to store them into
> 
>         board/<company>/<project>/linux-x.y.z-patches
>         board/<company>/<project>/uboot-x.y.z-patches
> 
> because those patches are typically board and project specific.
> 
> Where do you put them ? Directly in linux/ and boot/uboot/ ?

 Since I have a separate branch or even repository per project, yes I put them 
directly into the package directories.  But I realize this is not necessarily 
the best way to work.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
