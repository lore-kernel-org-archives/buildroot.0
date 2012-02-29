From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Feb 2012 23:17:54 +0000
Subject: [Buildroot] mesa3d fails
In-Reply-To: <20120229020844.08f20f46@gmail.com>
References: <20120228200231.7f26116f@gmail.com>
 <201202282304.16308.arnout@mind.be> <20120229020844.08f20f46@gmail.com>
Message-ID: <201202292317.54748.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 29 February 2012 04:08:44 Ismael Luceno wrote:
> >  Works for me...  Does config.log report anything about why it fails?
> > Is configure called with the correct PKG_CONFIG variable?  Can you do
> > a host/usr/bin/pkg-config --list-all to see if it finds libdrm?
> > 
> 
>   $ ./output/host/usr/bin/pkg-config --modversion libdrm
>   2.4.19
> 
> Since mesa3d is using AUTOTARGETS, I guess it's getting the right
> PKG_CONFIG. I'll check tomorrow, to be sure.

 Maybe you can hack mesa3d's configure to print PKG_CONFIG, and the exact 
pkg-config command used for libdrm.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
