From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 09:10:24 +0200
Subject: [Buildroot] [PATCH 19/23] Introduce BR2_TOOLCHAIN_USES_{UCLIBC,
	GLIBC}
In-Reply-To: <1372620553-11416-20-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:09 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-20-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87li5mn6lb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Currently, when we need to do a conditional on the type of C library
 Thomas> used, we need to take into account the three toolchain backends. As we
 Thomas> are going to add eglibc support to the Buildroot toolchain backend, it
 Thomas> would become even uglier, so this patch introduces two new hidden
 Thomas> options: BR2_TOOLCHAIN_USES_UCLIBC and BR2_TOOLCHAIN_USES_GLIBC, that
 Thomas> exist regardless of the toolchain backend. The entire Buildroot code
 Thomas> base is converted to use those options.

 Thomas> Note that we have intentionally created only one option
 Thomas> (BR2_TOOLCHAIN_USES_GLIBC) for both glibc and eglibc, since they are
 Thomas> essentially the same, as far as Buildroot is concerned.

Committed, thanks.

-- 
Bye, Peter Korsgaard
