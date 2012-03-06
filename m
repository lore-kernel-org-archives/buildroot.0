From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Mar 2012 08:00:39 +0100
Subject: [Buildroot] [PATCH] bifferboard: new board
In-Reply-To: <20120305104929.00b97692@skate>
References: <201203031529.36487.arnout@mind.be>
 <1330788921-27127-1-git-send-email-arnout@mind.be>
 <20120305104929.00b97692@skate>
Message-ID: <201203060800.39627.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 March 2012 10:49:29 Thomas Petazzoni wrote:
> Le Sat,  3 Mar 2012 15:35:21 +0000,
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :
> 
> >  board/bifferboard/busybox-1.19.x.config | 1013 +++++++++++++++++++++++++++++++
> 
> Isn't is possible to store minimal .config for Busybox, as we do for
> the kernel?

 Busybox doesn't have a savedefconfig target.  So it would be manual work...

> >  boot/grub/grub.mk                       |    1 +
> 
> Is the change in grub.mk really related to this patch?

 Ah, that's where that change went!  (Too many branches and stashes in my repo...)


 I'll resend later this week.  Or maybe Biff will?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
