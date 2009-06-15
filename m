From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Jun 2009 20:34:55 +0200
Subject: [Buildroot] ARCH not being sent by make menuconfig for "geode"
	- kernel compile fails to start
In-Reply-To: <26645697.32155.1245083767476.JavaMail.pwalters21@127.0.0.1>
	(pwalters's message of "Mon\,
	15 Jun 2009 12\:36\:07 -0400 \(EDT\)")
References: <26645697.32155.1245083767476.JavaMail.pwalters21@127.0.0.1>
Message-ID: <873aa1pcq8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "pwalters21" == pwalters21  <pwalters21@cox.net> writes:

Hi,

 pwalters21> When "Target Architecture Variant" is selected as
 pwalters21> 'geode', BR2_ARCH in .config is not set at all, and as
 pwalters21> result the toolchain fails to build.

 pwalters21> Please can we get this patch into target/Config.in.arch?

Committed, thanks.

-- 
Bye, Peter Korsgaard
