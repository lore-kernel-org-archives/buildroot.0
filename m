From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:43:48 +0200
Subject: [Buildroot] [PATCH 1/9] gcc: fix build of gcc 6.x on Microblaze
In-Reply-To: <1463436782-17051-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 00:12:54 +0200")
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87futhdw0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Due to patch 840-microblaze-enable-dwarf-eh-support.patch, gcc 6.x
 > does not build:

 > ../../gcc/config/microblaze/microblaze.c: In function 'void microblaze_expand_epilogue()':
 > ../../gcc/config/microblaze/microblaze.c:3046: error: 'gen_rtx_raw_REG' was not declared in this scope

 > This patch was originally added to gcc 4.9 to make it capable of
 > building glibc. However, this is no longer needed with gcc 6.x, which
 > builds glibc just fine.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
