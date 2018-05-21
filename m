From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 00:00:54 +0200
Subject: [Buildroot] [PATCH] util-linux: Bump to version 2.32
In-Reply-To: <1526938480.31570.89.camel@impinj.com> (Trent Piepho's message of
 "Mon, 21 May 2018 21:34:41 +0000")
References: <20180521191623.7049-1-tpiepho@impinj.com>
 <1526938480.31570.89.camel@impinj.com>
Message-ID: <877enwis89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

Hi,

 > Nevermind, I see I missed this change already being on buildroot/next.
 > If anyone wonders why mke2fs blocks for 2 seconds getting a filesystem
 > UUID on recent kernels on low boot entropy systems, it's because of the
 > problem described here.

I actually also hit this on 4.14.39 recently. Perhaps we should include
this bump (or better just the getrandom changes) on master and on
2018.02.x?

Care to send a patch for master?

-- 
Bye, Peter Korsgaard
