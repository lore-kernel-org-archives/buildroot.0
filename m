From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Sep 2014 09:38:20 +0200
Subject: [Buildroot] [PATCH] package/smstools3: fix for recent make
In-Reply-To: <1409604067-5820-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 1 Sep 2014 22:41:07 +0200")
References: <1409604067-5820-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87y4u2jwur.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > smstools3 defines variables in the middle of a recipe, which
 > make-3.81 accepts, but make-3.82 and later whine about.

 > Fixes:
 >     http://autobuild.buildroot.net/results/7fa/7fa839c7268256cb4f3b8728b3f50818cf3d3670/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@openwide.fr>

 > ---
 > Note: I only have make-3.81, so I can't really test this would fix the
 > autobuilder issue. Still, the Makefile really is wrong.

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
