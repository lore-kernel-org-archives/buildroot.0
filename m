From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Feb 2011 21:28:45 +0100
Subject: [Buildroot] [PATCH] mplayer: bump version to fix build error
In-Reply-To: <1297356435-11303-1-git-send-email-bjorn.forsman@gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Thu,
	10 Feb 2011 17:47:15 +0100")
References: <1297356435-11303-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <87fwrvhbwi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 Bj?rn> Bump mplayer to the first version that fixes this issue:
 Bj?rn> file.c:23:5: warning: "HAVE_MMAP" is not defined
 Bj?rn> file.c:25:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
 Bj?rn> file.c:77:5: warning: "HAVE_MMAP" is not defined
 Bj?rn> file.c:87:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
 Bj?rn> file.c:124:5: warning: "HAVE_MMAP" is not defined
 Bj?rn> file.c:126:7: warning: "HAVE_MAPVIEWOFFILE" is not defined
 Bj?rn> file.c: In function 'av_file_map':
 Bj?rn> file.c:50: error: 'HAVE_MMAP' undeclared (first use in this function)
 Bj?rn> file.c:50: error: (Each undeclared identifier is reported only once
 Bj?rn> file.c:50: error: for each function it appears in.)
 Bj?rn> make[2]: *** [file.o] Error 1

Committed, thanks.

-- 
Bye, Peter Korsgaard
