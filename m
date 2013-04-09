From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Apr 2013 07:46:38 +0200
Subject: [Buildroot] Trying to configure the kernel
In-Reply-To: <20130406152619.7d3f29c1@skate>
References: <1365192366.30488.205.camel@station1.ormlab.com>
 <20130406152619.7d3f29c1@skate>
Message-ID: <5163AB3E.2040004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/13 15:26, Thomas Petazzoni wrote:
> In short, there is no way to just "start the kernel configuration", you
> must first give it an initial existing configuration. Maybe we should
> add an option "Just run the kernel configuration with whatever defaults
> for the current architecture", so that you don't have to give an
> existing defconfig or an existing kernel configuration file.

  I posted a patch to do exactly that a long time ago. Don't have 
internet access at the moment so can't look up the patchwork reference.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
