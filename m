From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2011 13:45:06 +0200
Subject: [Buildroot] [PATCH v6 0/3] Add utilities to set background
	image in Fluxbox
In-Reply-To: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
References: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <201110171345.06616.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 17 October 2011 10:41:04, yegorslists at googlemail.com wrote:
> 
> Changes:
> v6: imlib2: always select freetype, feh: always select ImLib2 JPEG support
> v5: both imlib2 and feh depend on XORG7 and select relevant X-libraries
> v3: change package dependencies, so that both ImLib2 and feh depend on BR2_PACKAGE_XORG
> v2: add libXext dependency to ImLib2

 For the entire series:
Tested-By: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
