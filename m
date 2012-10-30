From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Oct 2012 00:48:06 +0100
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <201210310035.38831.yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <50905E98.3080207@mind.be> <201210310035.38831.yann.morin.1998@free.fr>
Message-ID: <50906736.90602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/12 00:35, Yann E. MORIN wrote:
>> >     There is still an alternative: patch Kconfig to "properly" handle
>> >  select/depend transitivity.  I.e., when a symbol selects another symbol,
>> >  this implies that all dependencies of the other symbol are inherited.  Did
>> >  anyone ever investigate the feasibility of such an feature?
> Yes. Both Thomas and I have had a look (but separately). I got an headache
> each time I tried to understand the kconfig code. IIRC, Thomas' experience
> was a bit in the same vein.
>
> My point of view is that we must consider (unless proven otherwise) that
> modifying kconfig to handle this select/depends mess is not possible.

  I completely agree.  But if it had been easy to do, it might have been
preferable over adding verbosity to Config.in.

  In that case, I guess I'll have to take the time to review those patches
before Saturday :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
