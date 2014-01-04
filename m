From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 Jan 2014 21:12:21 +0100
Subject: [Buildroot] [PATCH] manual: use current date/time for
	'generated on'
In-Reply-To: <1388852728-27381-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 4 Jan 2014 17:25:28 +0100")
References: <1388852728-27381-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87k3ef7bh6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Currently, the manual uses the last modification date and time of
 > manual.txt in the generated manual.

 > This is confusing, especially for long-checked-out repositories where
 > the top-level manual.txt has not changed since the check out. Moreover,
 > the manual explicitly states 'generated on', which is confusing at best.

 > Use the current date and time instead.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
