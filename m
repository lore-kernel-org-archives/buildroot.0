From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 00:56:03 +0200
Subject: [Buildroot] [PATCH 3/3] package/transmission: add optional
	support for libminiupnpc/libnatpmp
In-Reply-To: <87eg7apq1l.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 03 Jul 2016 19:52:38 +0200")
References: <1467497893-16126-1-git-send-email-bernd.kuhls@t-online.de>
 <1467497893-16126-3-git-send-email-bernd.kuhls@t-online.de>
 <87eg7apq1l.fsf@dell.be.48ers.dk>
Message-ID: <87furql4ak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> Transmission bundles copies of both libraries and uses them if they are
 >> not provided by the system. This patch allows transmission to use the
 >> system libraries of libminiupnpc/libnatpmp.

 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > Committed, thanks.

This unfortunately causes some build issues. Care to have a look?

http://autobuild.buildroot.org/results/bcd/bcdc704c48ccccc2f1203983574546dfca60ded7/build-end.log

-- 
Bye, Peter Korsgaard
