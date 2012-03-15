From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Mar 2012 22:32:23 +0100
Subject: [Buildroot] Remove clean and uninstall targets [was: Re: [PATCH
	1/2] Add (Freescale) elftosb host package]
In-Reply-To: <20120315222813.5d1e5113@skate>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <201203152206.35139.arnout@mind.be> <20120315222813.5d1e5113@skate>
Message-ID: <201203152232.24114.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 15 March 2012 22:28:13 Thomas Petazzoni wrote:
> Or, better, you can do:
> 
>         make <pkg>-rebuild
> 
> Why would you need to do a 'make clean'? If you did some changes in the
> package source code, running 'make' is sufficient to get things
> rebuilt, unless the package has a broken build system, no?

 For instance, modifying a Makefile to add a '-DFOO' to CFLAGS usually
doesn't force recompilation of all C files.

 But as I said, it's really a corner case.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
