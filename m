From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 23:58:42 +0200
Subject: [Buildroot] [PATCH 03/12] pkg-infra: move the cvs download
	helper to a script
In-Reply-To: <1ac3b6a63b90203b5805069af6aeab7ec73dd033.1404335385.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 2 Jul 2014 23:11:21 +0200")
References: <cover.1404335385.git.yann.morin.1998@free.fr>
 <1ac3b6a63b90203b5805069af6aeab7ec73dd033.1404335385.git.yann.morin.1998@free.fr>
Message-ID: <87tx6za0dp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Maintaining the download helpers in the Makefile has proved to be a bit
 > complex, so move it to a shell script.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > Changes v9 -> v10:
 >   - use bash as shell  (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
