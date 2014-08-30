From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 23:31:33 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libdaemon: add patch to fix
	build with the musl C library
In-Reply-To: <1409429739-2998-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sat, 30 Aug 2014 22:15:39 +0200")
References: <1409429739-2998-1-git-send-email-jkrause@posteo.de>
Message-ID: <87sikdoea2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Adds a patch to the package libdaemon which removes an error when building
 > libdaemon against the musl C library.

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>
 > ---
 > Changes v1 -> v2:
 >   - Add description to the top of the patch file
 >   - Add signed-off-by line to the patch file
 >   - Prefix the patch file name with libdaemon

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
