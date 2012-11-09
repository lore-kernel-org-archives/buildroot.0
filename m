From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 11:36:21 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <20121109113112.1a7606ff@skate>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
 <20121109113112.1a7606ff@skate>
Message-ID: <509CDCA5.3040903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 11:31, Thomas Petazzoni wrote:
> This patch unfortunately breaks the build of cpanminus, which
> apparently still requires qemu:

  Of course, I didn't think of that...  The solution is to install miniperl and
its wrapper in the host directory.

  I'll try to take a look at it later.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
