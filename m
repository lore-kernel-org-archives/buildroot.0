From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Nov 2014 18:30:40 +0100
Subject: [Buildroot] [PATCH] package/erlang: disable for static builds
In-Reply-To: <1416675250-30116-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 22 Nov 2014 17:54:10 +0100")
References: <1416675250-30116-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d28fuoqn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > erlang wants to build shared libs, always.
 > So, disable erlang when we're building static-only.

 > Fixes:
 >     http://autobuild.buildroot.net/results/1ce/1ceaa6925d1ded236d01ae9feb31f5f915f6b51a/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
