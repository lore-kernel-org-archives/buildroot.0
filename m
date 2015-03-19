From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 22:11:18 +0100
Subject: [Buildroot] Buildroot on OSX
In-Reply-To: <CA+-urNQQ9gSwRtmkNq0FBTDqaBuc5bZSS3LQYgsNGB3aEa4sHw@mail.gmail.com>
References: <CA+-urNQQ9gSwRtmkNq0FBTDqaBuc5bZSS3LQYgsNGB3aEa4sHw@mail.gmail.com>
Message-ID: <550B3B76.6090504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/15 14:21, Frank Hunleth wrote:
> Hi,
> 
> I was just asked if it was possible to use Buildroot natively on a
> Mac. I recommended that he just build in a Linux VM. However, after
> playing around at command line and learning about Homebrew, it looked
> like it may not be too far off especially since Buildroot builds so
> much itself. Ignoring external toolchains which I would assume
> wouldn't work, has anyone done this?

 IIRC there have been some patches to improve the OSX support, but I don't think
it's really been followed up so probably some scripts have bitrotted.

 Also bash is a hard dependency, but that shouldn't be an issue I suppose.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
