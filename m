From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 Nov 2012 20:20:28 +0100
Subject: [Buildroot] [PATCHv2 07/10] busybox: update-all-config
 shouldn't update default busybox config
In-Reply-To: <509A180C.2050409@lucaceresoli.net>
References: <1351063027-13800-1-git-send-email-arnout@mind.be>
 <1351063027-13800-8-git-send-email-arnout@mind.be>
 <509A180C.2050409@lucaceresoli.net>
Message-ID: <509AB47C.1060309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/07/12 09:13, Luca Ceresoli wrote:
> Up to here you're automating the config filename handling, not doing
> anything related to update-config. It may be worth splitting the patch,
> although the changed lines are very few.

  Since there's no reason for automating the config filename handling except
to enable the update-config, I don't think it's worth to split it.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
