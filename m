From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Aug 2016 13:47:50 +0200
Subject: [Buildroot] [PATCH] arch: add missing 'string' declaration to
 BR2_LD_TARGET_EMULATION
In-Reply-To: <87mvkaphq9.fsf@dell.be.48ers.dk>
References: <1471505353-20289-1-git-send-email-arnout@mind.be>
 <87mvkaphq9.fsf@dell.be.48ers.dk>
Message-ID: <fb877440-a8ef-5fa1-bfef-315b0ca388a2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-08-16 11:08, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  > Commit dc6f4c8 forgot to give a type (string) to the newly introduced
>  > BR2_LD_TARGET_EMULATION symbol.
> 
> Ehh, we don't have a dc6f4c8 commit. Are you referring to
> 
> http://patchwork.ozlabs.org/patch/606691/
> 
> If so, is this a sneaky way of sending your acked-by? ;)

 Oops... It looks like my master isn't clean, it still has a stack of patches I
was about to review months ago (and my git pull does implicit rebase). And it
seems I even forgot to apply http://patchwork.ozlabs.org/patch/606690/ which
adds the "string" declaration to arch/Config.in...

 So I've marked this one as rejected. Sorry for the noise...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
