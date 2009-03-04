From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Mar 2009 14:23:10 +0100
Subject: [Buildroot] dmraid: fix build & convert to Makefile.autotools.in
In-Reply-To: <1236077910-15674-6-git-send-email-razzor@kopf-tisch.de> (Olaf
	Rempel's message of "Tue\, 3 Mar 2009 11\:58\:27 +0100")
References: <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-5-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-6-git-send-email-razzor@kopf-tisch.de>
Message-ID: <87ocwhh16p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

 Olaf> - was not building at all (x86 uclibc)
 Olaf> - adding devicemapper dependency

Thanks, committed as r25522.

-- 
Bye, Peter Korsgaard
