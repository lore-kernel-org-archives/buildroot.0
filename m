From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 May 2014 10:51:49 +0200
Subject: [Buildroot] [PATCH] fs: use our own tools when calling the
	fakerooted script
In-Reply-To: <1399729942-13571-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 10 May 2014 15:52:22 +0200")
References: <1399729942-13571-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87siog8zq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > export PATH=$(BR_PATH) so that the fakerooted script uses our
 > own tools before any of the host-system ones.

 > Reported-by: Samuel Martin <s.martin49@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
