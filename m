From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Jul 2012 12:59:19 +0200
Subject: [Buildroot] [PATCH] gob2: needs MMU
In-Reply-To: <1341575738-28876-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 6 Jul 2012 08:55:38 -0300")
References: <1341575738-28876-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87liivzvjs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> m4 needs MMU, so does bison, and so does gob2 which uses bison.
 Gustavo> Fixes build failure:
 Gustavo> http://autobuild.buildroot.net/results/f942b4ac770f3c7b27c42214af5bcec49f687da1/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
