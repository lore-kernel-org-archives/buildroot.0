From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 16 Oct 2014 10:18:46 +0200 (CEST)
Subject: [Buildroot] Raspaudio : how to use buildroot as a git submodule
In-Reply-To: <543EB21D.30408@mind.be>
Message-ID: <515967550.26643419.1413447526264.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Cordi
----- Mail original -----
> On 08/10/14 12:11, Jeremy Rosen wrote:
> >> > 
> > it would be handy to have multiple overlays, but it's not possible
> > with
> > the current buildroot infrastructure...
> 
>  You're talking about the rootfs overlay, right? BR2_ROOTFS_OVERLAY
>  can be a
> space-separated list of overlay directories.
> 

yeah, I realized that recently while re-reading the docs... thx for
pointing it out anyway.

>  Regards,
>  Arnout
> 
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
