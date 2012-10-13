From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Oct 2012 22:56:25 +0200
Subject: [Buildroot] [PATCH] beecrypt: enable OpenMP if Buildroot GCC
 supports it
In-Reply-To: <CABtOAfyEmazbYa6k1ctPWvBEgBLug87oQPBkMcjoFX=ZvVEW-w@mail.gmail.com>
References: <1350071690-11279-1-git-send-email-stefan.froberg@petroprogram.com>
 <50793478.1090305@mind.be> <50796BDA.3040008@petroprogram.com>
 <50796CB1.8040106@mind.be> <507975A3.8080009@petroprogram.com>
 <CABtOAfyEmazbYa6k1ctPWvBEgBLug87oQPBkMcjoFX=ZvVEW-w@mail.gmail.com>
Message-ID: <5079D579.1060207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/12 16:54, Alexander Khryukin wrote:
> Use my patch please
>
> http://pastie.org/pastes/5052617/text

  That patch adds -lgomp unconditionally, even if OpenMP is not available.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
