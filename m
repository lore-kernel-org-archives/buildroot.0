From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Jul 2011 15:06:09 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: Add missing dependency of
	tst_uuid.o on uuid.h
In-Reply-To: <87aacb7ndc.fsf@macbook.be.48ers.dk>
References: <1310991099-3829-1-git-send-email-arnout@mind.be>
 <87aacb7ndc.fsf@macbook.be.48ers.dk>
Message-ID: <201107181506.10716.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 18 July 2011 15:02:39, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> 
writes:
>  Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>  Arnout> The missing dependency used to break parallel builds.
> 
>  Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be>
> 
> Thanks. What is the upstream status of this patch?

 I sent it to Theodore T'so at the same time.  He wasn't as quick in replying 
:-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
