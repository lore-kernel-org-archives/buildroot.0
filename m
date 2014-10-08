From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 08:35:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: Add patch to fix
	build error with musl
In-Reply-To: <1412029129-12590-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 30 Sep 2014 00:18:49 +0200")
References: <1412029129-12590-1-git-send-email-jkrause@posteo.de>
Message-ID: <87r3yjdq6i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Fix build error with musl:
 >   - Instead of using the nonstandard pthread_yield call use the standardized
 >     sched_yield.

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
