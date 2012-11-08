From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 22:09:55 +0100
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509AA0C4.4060506@petroprogram.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
Message-ID: <509C1FA3.5060206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/07/12 18:56, Stefan Fr?berg wrote:
> Nope, no sudo in my live Cd.
> Just few pre-made device nodes in fs/skeleton/dev

  So, when buildroot copies these to output/target/dev you get:
cp: cannot create special file `...': Operation not permitted
unless you run the build as root.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
