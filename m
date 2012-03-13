From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Mar 2012 23:48:20 +0100
Subject: [Buildroot] [PATCH] libethumb: Fix automagic dependencies on
	libedbus and libexif
In-Reply-To: <87obs0lmx2.fsf@macbook.be.48ers.dk>
References: <4F54C2BC.8090703@imgtec.com>
 <1331471700-17563-1-git-send-email-arnout@mind.be>
 <87obs0lmx2.fsf@macbook.be.48ers.dk>
Message-ID: <201203132348.21457.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 13 March 2012 13:12:41 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  Arnout> From: Markos Chandras <markos.chandras@imgtec.com>
> 
>  Arnout> libethumb will determine during configuration phase whether to
>  Arnout> build the optional libexif and libedbus modules. It will enable
>  Arnout> this modules if libedbus or libexif are present on the target
>  Arnout> system. Therefore, we need to add these packages as optional
>  Arnout> dependencies to libethumb.
> 
>  Arnout> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>  Arnout> ---
>  Arnout> Arnout: Resending as in-line patch for easy review.
>  Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Committed, thanks - But your signed-off-by should go before the '---'

 The sign-off was an accident (git send-email -s habit).  Since it's 
purely a resend without any modification, I didn't feel it warranted 
my signoff line.  DCO isn't entirely clear on this, if you ask me.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
