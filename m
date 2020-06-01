From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:05:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/audit: fix -fno-common build
 failure
In-Reply-To: <20200518054331.5106-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Mon, 18 May 2020 07:43:32 +0200")
References: <20200518054331.5106-1-heiko.thiery@gmail.com>
Message-ID: <87a71mh7qr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Added upstream patch for fixing build failure when using GCC10 as a host
 > compiler (-fno-common is now default).

 > Fixes:
 > http://autobuild.buildroot.net/results/c4b/c4bba80e9fc476247c7ba28850831c6a8edd559f/build-end.log

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
