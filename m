From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 11:49:25 +0200
Subject: [Buildroot] [PATCH] uclibc: arc: add patch that adds
	__kernel_(u)long
In-Reply-To: <1373448351-2201-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Wed, 10 Jul 2013 11:25:51 +0200")
References: <1373448351-2201-1-git-send-email-mjonker@synopsys.com>
Message-ID: <877ggyhhi2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> This adds a patch that adds the __kernel_long and
 Mischa> __kernel_ulong types to uClibc. This fixes the build failure
 Mischa> with Linux 3.10 headers.

Committed, thanks.

-- 
Bye, Peter Korsgaard
