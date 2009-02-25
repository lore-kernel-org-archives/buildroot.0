From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 25 Feb 2009 16:24:42 +0100
Subject: [Buildroot] Cris strace-4.5.18 patch
In-Reply-To: <87ab8aomgm.fsf@macbook.be.48ers.dk>
References: <49A50682.2050903@cetrtapot.si>	<20090225100001.3e6bffd7@hcegtvedt>	<20090225100317.4e26431f@hcegtvedt>
	<49A516ED.9050603@cetrtapot.si>
	<87ab8aomgm.fsf@macbook.be.48ers.dk>
Message-ID: <49A562BA.5070207@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:
> 
> Hi,
> 
>  >> Woha, look at me, I'm on the strace-devel list as well and though this
>  >> was mailed there. You should email the patch there, so that it will be
>  >> included in mainline.
> 
>  Hinko> I'll do that and re-base the patch against CVS tree.
> 
> Thanks.
> 
>  >> For Buildroot you should make a patch changing what needs to be
>  >> done in SVN and adding your patch properly.
> 
>  Hinko> Right, I don't have SVN commit permissions, so I'll resend the
>  Hinko> patch here. Is that OK?
> 
> Yes, that's fine.
> 

I've pulled SVN source and made cris modifications to strace-4.5.18, then I moved the strace-4.5.18 to strace-4.5.18.cris and made diff between newly unpacked strace-4.5.18 (wo cris support) and strace-4.5.18.cris.

Here is the result. I've intentionally left out configure script changes, so automake && autoreconf have to be ran before using configure script.

I hope this works for you.

Best regards,
Hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: strace-zzz-cris.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090225/6c027f4f/attachment-0001.diff>
