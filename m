From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 Nov 2012 00:12:48 +0100
Subject: [Buildroot] no jack?
In-Reply-To: <CAN0CFw31RjieVoSKf9QOAud5yHe6w-oy_J77V9iLYxu2-pSz5g@mail.gmail.com>
References: <CAN0CFw31RjieVoSKf9QOAud5yHe6w-oy_J77V9iLYxu2-pSz5g@mail.gmail.com>
Message-ID: <50999970.3020308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/12 22:39, Grant wrote:
> Is there a jack package available for buildroot?

  No, but it shouldn't be too difficult to integrate.  Look at midori for an
example of a package using waf as the build system.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
