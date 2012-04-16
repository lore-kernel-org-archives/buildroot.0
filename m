From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Apr 2012 13:15:05 +0200
Subject: [Buildroot] [PATCH] boost: bump to 1.49.0
In-Reply-To: <4F8BFA61.7070703@visionsystems.de> (Yegor Yefremov's message of
 "Mon, 16 Apr 2012 12:54:25 +0200")
References: <1334241592-3024-1-git-send-email-yegorslists@googlemail.com>
 <87lilxbe2g.fsf@macbook.be.48ers.dk>
 <4F8BCF8A.2090608@visionsystems.de>
 <4F8BFA61.7070703@visionsystems.de>
Message-ID: <87d3789bd2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 Yegor> You're right. After I made git pull it is failing now. I have
 Yegor> also another issue with Linaro toolchain (both 1.47 and 1.49).

There seems to be two new boost modules (locale + timer). I believe I've
fixed it now, just need to finish a test build to check.

-- 
Bye, Peter Korsgaard
