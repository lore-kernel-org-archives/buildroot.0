From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 19:55:57 +0100
Subject: [Buildroot] [PATCH] arch/arm: use EABIhf by default with VFP
In-Reply-To: <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 (=?utf-8?Q?=22Beno=C3=AEt_Th=C3=A9baudeau=22's?= message of "Sun, 25 Oct
 2015 16:19:40 +0100")
References: <87k2qn6gf0.fsf@dell.be.48ers.dk>
 <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <877fmaixqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> writes:

 > Set EABIhf as the default target ABI for the ARM processors that have or
 > may have a VFP unit, since this ABI is the most efficient in that case.
 > Of course, EABI can still be selected manually if needed.

On a related note, should we default to thumb2 if the CPU supports it?

-- 
Venlig hilsen,
Peter Korsgaard 
