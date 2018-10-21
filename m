From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 23:27:44 +0200
Subject: [Buildroot] [PATCH] package binutils: remove binutils 2.27
 patches
In-Reply-To: <20181021175331.16048-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 21 Oct 2018 19:53:31 +0200")
References: <20181021175331.16048-1-romain.naour@gmail.com>
Message-ID: <87tvlf3s8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > binutils 2.27 support was removed with [1]
 > [1] 453d29f1f45736d0156071930a09015def68994a

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > This patch must be backported to 2018.02 and 2018.08.

I guess you mean "is applicable"? It doesn't seem very important, but it
also cannot hurt.

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
