From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 23:04:16 +0000
Subject: [Buildroot] mesa3d fails
In-Reply-To: <20120228200231.7f26116f@gmail.com>
References: <20120228200231.7f26116f@gmail.com>
Message-ID: <201202282304.16308.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 28 February 2012 22:02:31 Ismael Luceno wrote:
> I'm getting the following error:
> 
> > checking for LIBDRM... configure: error: Package requirements
> > (libdrm >= 2.4.3) were not met:
> >
> > No package 'libdrm' found
> <...>
> 
> But libdrm 2.4.19 is installed... anyone ran into this?

 Works for me...  Does config.log report anything about why it fails?
Is configure called with the correct PKG_CONFIG variable?  Can you do a
host/usr/bin/pkg-config --list-all to see if it finds libdrm?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
