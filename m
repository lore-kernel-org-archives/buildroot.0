From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 May 2019 08:37:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: security bump to
 version 2.3.6
In-Reply-To: <20190430180822.30857-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 30 Apr 2019 20:08:21 +0200")
References: <20190430180822.30857-1-bernd.kuhls@t-online.de>
Message-ID: <87v9yte4zo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > * CVE-2019-11494: Submission-login crashed with signal 11 due to null
 >   pointer access when authentication was aborted by disconnecting.
 > * CVE-2019-11499: Submission-login crashed when authentication was
 >   started over TLS secured channel and invalid authentication message
 >   was sent.

 > Release notes:
 > https://dovecot.org/pipermail/dovecot-news/2019-April/000408.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
