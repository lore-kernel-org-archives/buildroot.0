From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jul 2010 10:45:18 +0200
Subject: [Buildroot] [PATCH 1/3] Globally remove aclocal directories
	from target
In-Reply-To: <1279970474-15052-1-git-send-email-m-starostik@versanet.de>
	(Malte Starostik's message of "Sat, 24 Jul 2010 13:21:12 +0200, Sat,
	24 Jul 2010 13:21:25 +0200")
References: <201007241319.49745.m-starostik@versanet.de>
	<1279970474-15052-1-git-send-email-m-starostik@versanet.de>
Message-ID: <877hkdl5nl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Malte" == Malte Starostik <m-starostik@versanet.de> writes:

 Malte> * Remove $(TARGET_DIR)/usr/share/aclocal from target-finalize when not
 Malte>   installing devfiles and
 Malte> * Remove some (now) redundant cleanup from individual packages

Committed, thanks.

-- 
Bye, Peter Korsgaard
