From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Oct 2012 09:27:12 +0200
Subject: [Buildroot] [PATCH v2] fluxbox: select xmodmap
In-Reply-To: <1351161652-9231-1-git-send-email-yegorslists@googlemail.com>
References: <1351161652-9231-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <508A3B50.1030202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/12 12:40, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov<yegorslists@googlemail.com>
>
> Fluxbox uses xmodmap in its startup script.

  I'm not so sure...  The user could change the startup script to remove the
xmodmap (e.g. for a keyboardless device), but now you take away the
possibility to build without it.

  OTOH, xmodmap is so small compared to (tiny)X that it shouldn't matter much.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
