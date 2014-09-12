From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Sep 2014 23:15:55 +0200
Subject: [Buildroot] [PATCH 04/12] xapp_xsm: depends on MMU
In-Reply-To: <1410537011-29662-5-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:03 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-5-git-send-email-jezz@sysmic.org>
Message-ID: <87vbosbkvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Fixes: http://sysmic.org/~jezz/results/455f2788:
 > remote.o: In function `_remote_start':
 > remote.c:(.text+0x74): undefined reference to `_fork'
 > restart.o: In function `_Clone':
 > restart.c:(.text+0x5a8): undefined reference to `_fork'
 > restart.o: In function `_Restart':
 > restart.c:(.text+0xa44): undefined reference to `_fork'
 > collect2: ld returned 1 exit status

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
