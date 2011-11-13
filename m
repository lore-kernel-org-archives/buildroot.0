From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:56:51 +0100
Subject: [Buildroot] [PATCH 1/2] uClibc: fix sparc build breakage
In-Reply-To: <87aa82z7ge.fsf@macbook.be.48ers.dk>
References: <1321045967-6216-1-git-send-email-gustavo@zacarias.com.ar>
 <87aa82z7ge.fsf@macbook.be.48ers.dk>
Message-ID: <20111113095651.22f5942c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 11 Nov 2011 22:15:45 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> >>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
>  Gustavo> Fix build breakage for sparc as reported in bug #4021
>  Gustavo> Patches from Konrad Eisele <konrad@gaisler.com>
>  Gustavo> Submitted in the uclibc mailing list.
> 
> Committed to next, thanks.

Since it fixes a build breakage, shouldn't it be applied to 2011.11
instead ? The fix itself only touches Sparc, so the risk is fairly
minimal.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
