From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 May 2014 23:27:44 +0200
Subject: [Buildroot] [PATCH] toolchain-external: restrict Musl external
	toolchain to Microblaze BE
In-Reply-To: <1401481479-23667-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 30 May 2014 22:24:39 +0200")
References: <1401481479-23667-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqd36jov.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As reported by William Welch <bvwelch@gmail.com>, the Musl external
 > toolchain provided by the musl-cross project is only Microblaze
 > big-endian. In fact, Musl seems to only support the big endian variant
 > of the Microblaze architecture, with the microblaze-* tuple.

 > This commit makes sure the Musl pre-built external toolchain provided
 > by musl-cross can only be selected for a big-endian Microblaze
 > configuration.

 > Reported-by: William Welch <bvwelch@gmail.com>
 > Cc: William Welch <bvwelch@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > This is a fix, should be committed to 2014.05.

Committed, thanks.

-- 
Bye, Peter Korsgaard
