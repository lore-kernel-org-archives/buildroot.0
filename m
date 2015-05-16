From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 23:29:02 +0200
Subject: [Buildroot] [PATCH] package.mnono: fix install with parallel
	builds
In-Reply-To: <1431797495-6157-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 16 May 2015 19:31:35 +0200")
References: <1431797495-6157-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87twvc8b4x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Due to a race in the 'install' utility, installing the same file twice
 > in parallel often results in one of the install calls to fail.

 > Ensure proper ordering of conflicting rules.

Committed with the typo in $SUBJECT fixed, thanks.

-- 
Bye, Peter Korsgaard
