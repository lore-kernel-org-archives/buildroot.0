From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Mar 2012 23:50:18 +0100
Subject: [Buildroot] [git commit] libfuse: fix download URL
In-Reply-To: <20120315081313.4521190D8E@busybox.osuosl.org>
References: <20120315081313.4521190D8E@busybox.osuosl.org>
Message-ID: <201203152350.18988.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 15 March 2012 09:12:47 Peter Korsgaard wrote:
> -LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
> +LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)

$ git grep -l dl.sourceforge.net/sourceforge | wc -l
71

 Oops, looks like we have a bit of work here...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
