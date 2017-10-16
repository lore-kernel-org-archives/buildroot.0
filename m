From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 00:02:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: not available in
	static builds
In-Reply-To: <20170913101823.12808-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 13 Sep 2017 12:18:23 +0200")
References: <20170913101823.12808-1-bernd.kuhls@t-online.de>
Message-ID: <87mv4qoiop.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream only support shared builds:
 > https://github.com/librsync/librsync/blob/master/CMakeLists.txt#L319

 > Fixes
 > http://autobuild.buildroot.net/results/4b8/4b8db2d520373d0c9127e0d7695b5aeda6925dc5/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
