From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jul 2010 10:44:41 +0200
Subject: [Buildroot] [PATCH 2/3] Purge libglib2 dev files from target
In-Reply-To: <1279970474-15052-2-git-send-email-m-starostik@versanet.de>
	(Malte Starostik's message of "Sat, 24 Jul 2010 13:21:13 +0200, Sat,
	24 Jul 2010 13:21:28 +0200")
References: <201007241319.49745.m-starostik@versanet.de>
	<1279970474-15052-2-git-send-email-m-starostik@versanet.de>
Message-ID: <87bp9pl5om.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Malte" == Malte Starostik <m-starostik@versanet.de> writes:

 Malte> * Don't install libglib2 development binaries and to target unless
 Malte>   BR2_HAVE_DEVFILES is set

Committed, thanks.

-- 
Bye, Peter Korsgaard
