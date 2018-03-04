From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Mar 2018 10:16:19 +0100
Subject: [Buildroot] [PATCH v1] libv4l: fix libdvbv5 musl compile
In-Reply-To: <20180304083653.15340-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 4 Mar 2018 09:36:53 +0100")
References: <20180304083653.15340-1-ps.report@gmx.net>
Message-ID: <87woys9p5o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add optional copy of TEMP_FAILURE_RETRY macro.
 > Fixes [1]:

 >   ../../lib/libdvbv5/.libs/libdvbv5.so: undefined reference to `TEMP_FAILURE_RETRY'

 > [1] http://autobuild.buildroot.net/results/7aea0cbb9e7fe7d9919c9be04ba4567ddcf4e15e

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed after adding the upstream submission link as suggested by
Baruch, thanks!

-- 
Bye, Peter Korsgaard
