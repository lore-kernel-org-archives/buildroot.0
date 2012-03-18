From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 16:17:46 +0100
Subject: [Buildroot] Applying Ludovic's patches
In-Reply-To: <20120314224659.23a5d71c@skate>
References: <20120314224659.23a5d71c@skate>
Message-ID: <201203181617.47024.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 March 2012 22:46:59 Thomas Petazzoni wrote:
> Could you merge soon the patches that Ludovic Desroches from Atmel has
> prepared? He has been working on this and posting regular versions of
> this patch set since may 2011, so it's been a very long time, and both
> Atmel and Armadeus need the capability of using a tarball of patches to
> deliver patches for the Linux kernel or other components (U-Boot, etc.).
> 
> The time we have taken to react is really not a good invitation for
> Ludovic or other developers from Atmel to contribute further to
> Buildroot, and this is bit sad. I hope we can get this solved quickly
> and get more contributions.

 +1

 One of the talks I attended at FOSDEM was about how to build a strong
community.  Its main message was: give newcomers what they want, and
they'll become regular contributors.  And what do newcomers want?  They
want to be recognized for their work, i.e. they want to see their name
in the git log.

 Therefore, this guy suggested to commit patches even if they're not yet
perfect or feature complete.  It's always possible to make further
modifications.

 Now, we should keep up our quality standards.  It's good to have a git
master that builds.  But it does sometimes take too long for patches to
be accepted, and sometimes patches are forgotten.

 I was hoping that patchwork would help with that.  Is there any
progress on that front?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
