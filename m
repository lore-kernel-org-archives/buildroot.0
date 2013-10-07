From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Oct 2013 22:16:08 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: needs largefile support
In-Reply-To: <20131007195645.5c17a27f@skate> (Thomas Petazzoni's message of
 "Mon, 7 Oct 2013 19:56:45 +0200")
References: <20131006184759.B376396CB6@busybox.osuosl.org>
 <20131007195645.5c17a27f@skate>
Message-ID: <87li2496rb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> depends on BR2_TOOLCHAIN_HAS_THREADS
 >> depends on BR2_INET_IPV6
 >> +	depends on BR2_LARGEFILE

 Thomas> Did you had a specific build failure in a !largefile case?

Yes. I don't have the build results at hand, but I believe it was the
usual uClibc-complaining-about-FILE_OFFSET_BITS/LARGEFILE_SOURCE-getting-redefined.

I can retest if you're interested.

-- 
Bye, Peter Korsgaard
