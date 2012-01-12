From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Jan 2012 00:13:13 +0100
Subject: [Buildroot] [PATCH 7/7] sam-ba: new package with host variant
	only
In-Reply-To: <20120102142959.0abeedb8@skate>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
 <1325510735.2442.2.camel@emblysd024.adetel.com>
 <20120102142959.0abeedb8@skate>
Message-ID: <201201130013.13601.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 02 January 2012 14:29:59 Thomas Petazzoni wrote:
> Hello Alexandre,
> 
> Le Mon, 02 Jan 2012 14:25:35 +0100,
> Alexandre Belloni <abelloni@adeneo-embedded.com> a ?crit :
> 
> > Shouldn't we go further and provide scripts to flash the boards using
> > the
> > default addresses used in at91bootstrap and u-boot ?
> 
> Indeed, that would be the next step to improve the board support for
> AT91 evaluation boards. You are welcome to contribute patches :-)

 Buildroot is missing post-image scripting in general.  You will typically
want to package the kernel and rootfs in a compressed and signed image that
can be distributed and installed on the target.  Or during development, you
would like to untar it to the nfsroot.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
