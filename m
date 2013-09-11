From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Sep 2013 23:22:16 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <AF069D6A-BBA5-4CE4-B424-22362C2C6128@layer-7.net>
References: <1378677483-2424-1-git-send-email-rommel@layer-7.net>
 <AF069D6A-BBA5-4CE4-B424-22362C2C6128@layer-7.net>
Message-ID: <5230DF08.9080402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/13 20:34, Michael Rommel wrote:
> @Arnout: you made comment regarding use of the toolchains from the
> autobuilders. I do not fully understand what you mean, do you refer to these:
> http://autobuild.buildroot.net/toolchains/configs/free-electrons/
> configurations and suggest, that I set up some of these cross compilers to
> test packages I submit first, if they work under these configs? Which would be
> the most important ones - I do not have so much space to accomodate them
> all, so if I must focus on 3-5, which should I take?

  I actually mean e.g. 
http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2013.05-1.tar.bz2 
- it has IPv6 and largefile, nothing else.

  One uClibc build is probably sufficient. If something else is wrong it 
will come out of the autobuilders.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
