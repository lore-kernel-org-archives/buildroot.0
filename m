From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Feb 2010 11:28:22 +0100
Subject: [Buildroot] [PATCH 1/1] Add patch to fix uClibc build failure
	with locale enabled
In-Reply-To: <2bf5840e578bf5ac8245f6ce27eb395acdbfd805.1266060467.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 13 Feb 2010 12:27:52 +0100")
References: <cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<2bf5840e578bf5ac8245f6ce27eb395acdbfd805.1266060467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pr442m2h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This patch fixes the undefined reference to `__iconv_codesets'
 Thomas> reported at
 Thomas> http://www.mail-archive.com/uclibc at uclibc.org/msg04970.html. The patch
 Thomas> has been taken from the upstream Git repository, and will be part of
 Thomas> uClibc 0.9.30.3. In the mean time, let's integrate it.

Thanks. Aything else in the stable branch we should take? Bernhard
mentioned that the ETA for 0.9.30.3 was ~2 weeks, so we might end up
releasing 2010.02 before then.

-- 
Bye, Peter Korsgaard
