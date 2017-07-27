From: =?UTF-8?B?0JDQvdCw0YHRgtCw0YHQuNGPINCS0LXRgtC+0YjQutC40L3QsA==?= <naka_sml@mail.ru>
Date: Thu, 27 Jul 2017 18:50:08 +0300
Subject: [Buildroot] =?utf-8?q?How_to_add_a_new_board_to_buildroot?=
Message-ID: <1501170608.440004909@f502.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day!
?
I have some problems with addind a new my_board to buildroot.
?
I've tried to develop linux kernel to special mips-32 processor.
?
May be you have some manual how to do it.
?
Thats what I've done:
?
1. download buildroot 2016-08
2. choose malta board (at least I need to add my_own_board, but i choose malta board because it is similar to mine board)
3. make
4. in folder arch/mips create folder my_board with needed files(Timers, initions, uart, exeptions), in uncludes also create folder my_board
5. copy changed folder linux-3-4-2 on local server
6. try to make buildroot using local linux.
7. at the end I have many errors: part of it because with my_board also malta-board is making...
?
May be you have manual or another paper how to add new_board to buildroot.
?
I'll be greatful if there is someone who can help me to add this new board.
?
Best regards, Anastasia.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170727/299bb913/attachment.html>
