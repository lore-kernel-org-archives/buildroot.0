From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jan 2012 21:07:48 +0100
Subject: [Buildroot] [PATCH] pkg-infra: fix missing 3993 for
	AUTOTARGET's SUBDIR
In-Reply-To: <87aa5fgyz0.fsf@macbook.be.48ers.dk>
References: <1327182759-23029-1-git-send-email-arnout@mind.be>
 <87aa5fgyz0.fsf@macbook.be.48ers.dk>
Message-ID: <201201232107.49146.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 22 January 2012 23:21:39 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>  Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> That isn't really a good commit message, but I adjusted that and
> committed, thanks.

 The 3993 is a $$ which got expanded to the shell's PID.  So no my shell's 
PID is saved in history for eternity :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
