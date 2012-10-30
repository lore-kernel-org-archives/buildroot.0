From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:19:13 +0100
Subject: [Buildroot] [PATCH 2/6] Add hdmiservice package for the
 snowball board
In-Reply-To: <1351500073-4351-3-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-3-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50905261.4050302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/12 09:41, Gregory Hermant wrote:
> @@ -529,6 +529,7 @@ menu "Miscellaneous"
>   source "package/collectd/Config.in"
>   source "package/empty/Config.in"
>   source "package/googlefontdirectory/Config.in"
> +source "package/hdmiservice/Config.in"

  Oh, and Hardware handling is probably a more appropriate menu.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
