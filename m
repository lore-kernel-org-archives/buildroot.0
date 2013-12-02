From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Dec 2013 09:49:32 +0100
Subject: [Buildroot] [PATCH 11/15] grub2: add new package
In-Reply-To: <20131202093525.65fe5a84@skate> (Thomas Petazzoni's message of
 "Mon, 2 Dec 2013 09:35:25 +0100")
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1384188459-1332-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <87r49wtcei.fsf@dell.be.48ers.dk> <20131202093525.65fe5a84@skate>
Message-ID: <87ob4zskmb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Doesn't grub2 also need BR2_HOSTARCH_NEEDS_IA32_COMPILER?

 > From what I've tested, no it doesn't. I believe this is because grub
 > legacy needed libgcc, while grub2 doesn't need libgcc, so you don't
 > need a multilib compiler: a non-multilib x86-64 gcc can generate 32 bits
 > code, but doesn't provide a 32 bits libgcc.

 > I can do another testing if needed, just to validate this once more
 > (it's been a while since I did this, and I may have overlooked
 > something).

Don't worry, I just wondered. If you already tested then that's
fine. I'll review and apply the rest of the series tonight.

-- 
Bye, Peter Korsgaard
