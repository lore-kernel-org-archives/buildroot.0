From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Dec 2010 22:04:18 +0100
Subject: [Buildroot] [PATCH] Add ttyO0 to ttyO3 in /etc/securetty in
	skeleton
In-Reply-To: <4D1CA946.5090009@free.fr> (Guillaume Gardet's message of "Thu,
	30 Dec 2010 16:46:14 +0100")
References: <4D1CA946.5090009@free.fr>
Message-ID: <87tyhvgegd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Gardet <guillaume.gardet@free.fr> writes:

 Guillaume> Hi,
 Guillaume> Recent kernels (2.6.37*) use a different name for OMAP serial ports. They are no longer called ttySx but ttyOx. This patch add ttyO0 to ttyO3 in /etc/securetty.
 Guillaume> Could you apply it in the trunk?

Committed, thanks.

-- 
Bye, Peter Korsgaard
