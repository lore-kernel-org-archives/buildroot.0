From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Jan 2012 11:33:20 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
	Brussels
In-Reply-To: <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
Message-ID: <201201271133.20517.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 25 January 2012 12:03:12 Thomas De Schampheleire wrote:
> On Tue, Jan 24, 2012 at 12:08 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
[snip]
> > So far, no agenda has been defined for this meeting. It would be great
> > to discuss a list of topics to be discussed at this developer day.
> >
> 
> Some topics we could discuss:
> 
[snip]
> - future directions for buildroot
> -- deprecate customize package
> -- ...

 I have a list of 21 ideas for things that I'd like to change in buildroot.
Any interest in me going over that list?  The most important ones are:

 -- support for overlays (cfr. openembedded)
 -- support for image-in-image (e.g. cpio+kernel on an ext3+grub on an MBR partition)
 -- shared infrastructure for xxx-yyyconfig
 -- shared infrastructure for non-autotools builds

 Also we should make a decision on the host-tools menu that was posted on 
the list before.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
