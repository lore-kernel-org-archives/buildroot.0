From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 00:49:24 +0100
Subject: [Buildroot] [RFC PATCH v2 4/6] apply-patches.sh: directories
	are considered as a collection of patches
In-Reply-To: <1329347174-25471-1-git-send-email-ludovic.desroches@atmel.com>
References: <20120215165104.GI4723@ldesroches-Latitude-E6320>
 <1329347174-25471-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <201202160049.24485.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 00:06:14 ludovic.desroches at atmel.com wrote:
> Behaviour of directories is changed: it is no more considered as an overlay,
> but rather a collection of patches. Subdirectories are not supported.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 BTW, if you update a few patches out of a series, it is usually better
to repost the entire series.  Otherwise there's a risk of some patches
getting lost.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
