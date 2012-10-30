From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:50:43 +0100
Subject: [Buildroot] [PATCH] [v3] Allow to run severals post build
 scripts instead of only one
In-Reply-To: <3558_1351493584_508E27D0_3558_1558_1_1351493605-22269-1-git-send-email-philippe.reynes@sagemcom.com>
References: <3558_1351493584_508E27D0_3558_1558_1_1351493605-22269-1-git-send-email-philippe.reynes@sagemcom.com>
Message-ID: <509059C3.4080109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/12 07:53, Philippe Reynes wrote:
> +	@$(call MESSAGE,"Executing post-build script\(s\)")

  Aren't these backslashes redundant?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
