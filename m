From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 18:08:21 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <1328609206.18704.12.camel@mathieu-OptiPlex-745>
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <8762fjt2m7.fsf@macbook.be.48ers.dk>
 <1328609206.18704.12.camel@mathieu-OptiPlex-745>
Message-ID: <201202071808.21506.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 07 February 2012 11:06:46 Mathieu wrote:
> On Tue, 2012-02-07 at 10:27 +0100, Peter Korsgaard wrote:
> > >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> >  >> diff --git a/board/freescale/mx53loco/linux.config b/board/freescale/mx53loco/linux.config
> >  Arnout>  Personally I'd prefer to use a kernel defconfig (mx5_defconfig), but
> >  Arnout> perhaps this one is more appropriate.
> > 
> > I agree if possible, as that's one thing less to maintain.
> > 
> 
> There are two differences between mx5_defconfig and this defconfig :
> - mx5_defconfig include several BSPs which result in a failure in uImage
> building (multiple load addresses).
> - CONFIG_MMC_BLOCK is set as module in mx5_defconfig. Since mx53 has no
> nand memory, this seemed relevant.

 Fair enough.  It would be good to document this in the log message.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120207/6553fcb0/attachment-0001.html>
