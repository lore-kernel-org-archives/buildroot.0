From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 18:12:58 +0200
Subject: [Buildroot] [PATCH v1] package/php: fix aarch64 uclibc-ng
 compile
In-Reply-To: <20200309145038.18093-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 9 Mar 2020 15:50:38 +0100")
References: <20200309145038.18093-1-ps.report@gmx.net>
Message-ID: <87tv1vp94l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The aarch64 compile uses the sys/auxv.h header which is not
 > provided by ulcibc-ng. Add configure.ac patch to check for
 > the header before using it in ext/standard/crc32.c.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12626

 >   build/php-7.4.3/ext/standard/crc32.c:26:12: schwerwiegender Fehler: sys/auxv.h: Datei oder Verzeichnis nicht gefunden

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
