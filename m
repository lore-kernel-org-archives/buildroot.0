From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 15:20:40 +0200
Subject: [Buildroot] [PATCHv3 05/20] toolchain-buildroot: convert to the
	package infrastructure
In-Reply-To: <1381256237-27948-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:02 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9ii4m3a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit converts the toolchain-buildroot logic to the package
 Thomas> infrastructure. The package is fairly simple as it only defines
 Thomas> BUILDROOT_LIBC, and depends on host-gcc-final to get the overall
 Thomas> internal toolchain build logic started.

It's more like getting it completed, but ok - Committed, thanks.

-- 
Bye, Peter Korsgaard
