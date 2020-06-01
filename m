From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:16:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: fix -fno-common build
 failure
In-Reply-To: <20200518064321.28523-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Mon, 18 May 2020 08:43:21 +0200")
References: <20200518064321.28523-1-heiko.thiery@gmail.com>
Message-ID: <87wo4qfsot.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Added upstream patch for fixing build failure when using GCC10 as a host
 > compiler (-fno-common is now default).

 > Fixes:
 > http://autobuild.buildroot.net/results/47f/47fcf9bceba029accdcf159236addea3cb03f12f/

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
