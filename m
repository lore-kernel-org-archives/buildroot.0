From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Sep 2014 23:20:29 +0200
Subject: [Buildroot] [PATCH 06/12] xapp_xdm: depends on MMU
In-Reply-To: <1410537011-29662-7-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:05 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-7-git-send-email-jezz@sysmic.org>
Message-ID: <87a964bko2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Fixes http://sysmic.org/~jezz/results/e891eb7e:
 > dm.o: In function `_StartDisplay':
 > dm.c:(.text+0xd6e): undefined reference to `_fork'
 > server.o: In function `_StartServerOnce':
 > server.c:(.text+0x266): undefined reference to `_fork'
 > session.o: In function `_runAndWait':
 > session.c:(.text+0x67a): undefined reference to `_fork'
 > session.o: In function `_ManageSession':
 > session.c:(.text+0xa2a): undefined reference to `_fork'
 > collect2: ld returned 1 exit status

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
