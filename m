From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Tue, 15 Dec 2020 12:22:33 +0100
Subject: [Buildroot] [PATCH 2/2] Defconfigs: fix rock64_defconfig
In-Reply-To: <b62fb17a-e2d1-b51d-04bb-4c8dabf48d36@gmail.com>
References: <20201214192321.9987-1-xuminready@gmail.com>
 <20201214192321.9987-2-xuminready@gmail.com>
 <f087b97a-7e71-9f9d-16d3-ad69ceaf09b5@gmail.com>
 <CAMpS7mTQmO1V5O9hxBP=DoU3GY0oCQUbxNjReeQi8ys6Xa-d4Q@mail.gmail.com>
 <20201215010824.ccpevcpsutcamxrv@marchewa.redembedded.pl>
 <b62fb17a-e2d1-b51d-04bb-4c8dabf48d36@gmail.com>
Message-ID: <20201215112233.ozzn23vyqu2q2dnd@marchewa.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-12-15 11:13:23, Romain Naour wrote:
> I guess we can wait for your runtime testing, don't forget to send your
> tested-by tag to:

# uname -a
Linux buildroot 4.19.19 #1 SMP PREEMPT Tue Dec 15 01:51:16 CET 2020 aarch64 GNU/Linux

I can confirm that clean rock64_defconfig builds and runs on the board.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201215/51b7b39c/attachment.asc>
