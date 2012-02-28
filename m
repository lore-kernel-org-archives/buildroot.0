From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 20:38:53 +0000
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <ji0b7n$2hl$1@dough.gmane.org>
References: <jhub5r$smv$1@dough.gmane.org> <4F435977.1060001@lucaceresoli.net>
 <ji0b7n$2hl$1@dough.gmane.org>
Message-ID: <201202282038.54757.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 21 February 2012 14:54:47 Grant Edwards wrote:
[snip]
> I don't want to replace the default skeleton.  I want to add some
> files to it, and possible modify a few.  The documentation describes
> two ways to do that:
> 
>   1) package/customize
> 
>   2) post-build script
> 
> I'm told 1) is now depricated, so I'm switching to 2).
> 
> Where under board/mycompany/myproduct do you put "extra" files that
> will be added to the standard skeleton?

 I put it in board/mycompany/myproduct/skeleton.  Although 
rootfs-additions would be a better name than skeleton.


 I would like to add a feature to buildroot to simplify out-of-tree
additions (rootfs files, patches, config files, extra packages, ...).
I'll send out an RFC for that soonish.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
