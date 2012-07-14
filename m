From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Jul 2012 23:47:04 +0200
Subject: [Buildroot] [PATCH] [v3] Allow to run severals post build
 scripts instead of only one
In-Reply-To: <31760_1341837606_4FFAD125_31760_18_1_1341837621-14884-1-git-send-email-philippe.reynes@sagemcom.com>
References: <31760_1341837606_4FFAD125_31760_18_1_1341837621-14884-1-git-send-email-philippe.reynes@sagemcom.com>
Message-ID: <5001E8D8.2020609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/12 14:40, Philippe Reynes wrote:
> Using severals post build scripts is usefull to share
> script between severals boards/projects.
>
> Signed-off-by: Philippe Reynes<philippe.reynes@sagemcom.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I assume you tested it with the $(sep)?  I didn't, I just reviewed.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
