From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:01:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/ntp: fix build for toolchains
	without ssp
In-Reply-To: <20170323193700.30404-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 23 Mar 2017 20:37:00 +0100")
References: <20170323193700.30404-1-bernd.kuhls@t-online.de>
Message-ID: <87o9wix73i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > ntp defaults to use ssp support
 > http://bk1.ntp.org/ntp-stable/sntp/harden/README

 > by using these flags
 > http://bk1.ntp.org/ntp-stable/sntp/harden/linux

 > If the toolchain lacks SSP support this patch forces ntp to use an
 > empty set of flags: http://bk1.ntp.org/ntp-stable/sntp/harden/default

 > Fixes
 > http://autobuild.buildroot.net/results/1d5/1d58bd8745b22c8eb71fea4c7255d3ace69f6f7a/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
