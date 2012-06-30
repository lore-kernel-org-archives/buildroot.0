From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 15:04:49 +0200
Subject: [Buildroot] Buildroot Udev Compiling
In-Reply-To: <19f6cb67d4b8fd0957ffd1ec1c9c4a2f@jonas-keidel.de>
References: <19f6cb67d4b8fd0957ffd1ec1c9c4a2f@jonas-keidel.de>
Message-ID: <4FEEF971.2000802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/29/12 07:52, Jonas Keidel wrote:
> it's me again. I have problems with udev compuiling in builroot...It stops with the following error message. I use the
> current git version of buildroot.
>
> Here ist my config file:
> http://pastebin.com/UU3HedKC

  I can't find the root cause of the problem (in fact, in my case it already
fails when compiling attr), but my guess is that BR2_PREFER_STATIC_LIB is
causing trouble.  Do you really need it?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
