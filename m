From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 May 2014 23:29:16 +0200
Subject: [Buildroot] [PATCH] package/elf2flt: hide when an MMU is used
In-Reply-To: <1401483162-17124-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 30 May 2014 22:52:42 +0200")
References: <1401483162-17124-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87oayf6jmb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > elf2flt is specifically for cases where an MMU is not available.
 > There is no point in building elf2flt when using an MMU.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
