From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 20:05:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/libpcap: bump to version 1.10.0
In-Reply-To: <b121a9435d868681c957e7bc9243fb84676d80e3.1611249364.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 21 Jan 2021 19:16:03 +0200")
References: <b121a9435d868681c957e7bc9243fb84676d80e3.1611249364.git.baruch@tkos.co.il>
Message-ID: <871rec94hk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > configure script now uses pkg-config. Add host-pkgconf dependency.
 > pkg-config should provide necessary info for libnl build/link. Don't
 > pass paths to configure.

 > Add --without-dpdk to make sure we don't link with host installed
 > libraries.

 > Format hashes with two space delimiters.

 > Use https for SITE to save redirect.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
