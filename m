From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 01:00:25 +0100
Subject: [Buildroot] [PATCH v2 1/1] libgsl : new package The GNU
	Scientific Library
In-Reply-To: <1331553632-509-2-git-send-email-sagaert.johan@skynet.be>
References: <1331553632-509-1-git-send-email-sagaert.johan@skynet.be>
 <1331553632-509-2-git-send-email-sagaert.johan@skynet.be>
Message-ID: <201203140100.26024.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 12 March 2012 13:00:32 Sagaert Johan wrote:
> +config BR2_PACKAGE_LIBGSL
> +       bool "libgsl"
> +       help
> +         The gnu scientific library 
> +         http://www.gnu.org/software/gsl

 It would be nice if the long text you wrote for the introductory message 
was in the help text as well (with proper indentation and line wraps, of
course).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
