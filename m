From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Sep 2014 23:16:02 +0200
Subject: [Buildroot] [PATCH 07/12] xterm: depends on MMU
In-Reply-To: <1410537011-29662-8-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:06 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-8-git-send-email-jezz@sysmic.org>
Message-ID: <87r3zgbkvh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Fixes http://sysmic.org/~jezz/results/53a729c3:
 > button.o: In function `_executeCommand':
 > ./button.c:(.text+0x21be): undefined reference to `_fork'
 > main.o: In function `_get_pty':
 > ./main.c:(.text+0xab0): undefined reference to `_getpt'
 > main.o: In function `_spawnXTerm':
 > ./main.c:(.text+0x1030): undefined reference to `_fork'
 > misc.o: In function `_creat_as':
 > ./misc.c:(.text+0x3a56): undefined reference to `_fork'
 > print.o: In function `_charToPrinter':
 > ./print.c:(.text+0x1ee): undefined reference to `_fork'

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
