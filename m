From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 08:34:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-06-15
In-Reply-To: <20160616063030.E179F101D31@stock.ovh.net> (Thomas Petazzoni's
 message of "Thu, 16 Jun 2016 08:30:30 +0200 (CEST)")
References: <20160616063030.E179F101D31@stock.ovh.net>
Message-ID: <87porhabgx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2016-06-15
 > ===============================

 >         success : 184
 >        failures : 152
 >        timeouts : 1  

Notice that a lot of these failures are from github issue yesterday
corrupting tarballs. I've pushed a number of .hash file additions, but
there's still more to go.

If somebody feels like helping, please send patches.

-- 
Bye, Peter Korsgaard
