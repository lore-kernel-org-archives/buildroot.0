From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 May 2014 10:51:11 +0200
Subject: [Buildroot] [PATCH] fs: use our own mkpasswd when creating users
In-Reply-To: <1399729186-30497-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 10 May 2014 15:39:46 +0200")
References: <1399729186-30497-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87wqds8zr4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Export PATH=$(BR_PATH) so that our own mkpasswd is found before
 > any existing host-system one.

 > Reported-by: Romain Naour <romain.naour@openwide.fr>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
