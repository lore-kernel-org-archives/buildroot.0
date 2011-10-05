From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 16:07:24 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
In-Reply-To: <1317719147-19210-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Tue, 4 Oct 2011 11:05:47
 +0200")
References: <1317719147-19210-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <874nznr0pv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> this version fixes compilation issue on some old build systems like
 yegorslists> openSUSE 10.3 saying some host libraries were too old

Thanks, committed. I dumped the minor version so it's 7.3 similar to how
we're doing it for the kernel headers or busybox.

-- 
Bye, Peter Korsgaard
