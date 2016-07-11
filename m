From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jul 2016 21:57:54 +0200
Subject: [Buildroot] [PATCH] package/systemd: import daemon needs
	headers >= 3.11
In-Reply-To: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 10 Jul 2016 22:34:56 +0200")
References: <1468182896-8355-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87eg709ccd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > ... since it uses O_TMPFILE as an open(2) flag, and it was only
 > introduced in 3.11.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Gabe Evans <gabe@hashrabbit.co>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
