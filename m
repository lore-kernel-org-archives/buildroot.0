From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 09:07:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdaemon: add patch to fix
	build with the musl C library
In-Reply-To: <1409352429-14773-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sat, 30 Aug 2014 00:47:09 +0200")
References: <1409352429-14773-1-git-send-email-jkrause@posteo.de>
Message-ID: <87mwampi9e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > examples/testd.c: As the C POSIX library recommends include the <unistd.h>
 > instead of <sys/unistd.h>. This removes an error when building libdaemon
 > against the musl C library.

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>

Please also:

- Add this description to the top of the patch file
- Add your signed-off-by line
- Send patch upstream
- Prefix the file name with libdaemon

See http://nightly.buildroot.org/manual.html#patch-policy for details,
thanks.

-- 
Bye, Peter Korsgaard
