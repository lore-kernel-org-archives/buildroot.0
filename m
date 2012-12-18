From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2012 09:38:20 +0100
Subject: [Buildroot] [PATCH] libglib2: fix g_print()
In-Reply-To: <1355774740-28679-1-git-send-email-benoit.thebaudeau@advansee.com>
 (=?utf-8?Q?=22Beno=C3=AEt_Th=C3=A9baudeau=22's?= message of "Mon, 17 Dec
 2012 21:05:40 +0100")
References: <1355774740-28679-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <87d2y77o1v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> writes:

 Beno?t> If GLib is cross-compiled, the default printf settings that it
 Beno?t> selects are wrong for glibc. This leads to issues with the
 Beno?t> g_print() functions, e.g. "Aborted" errors returned by
 Beno?t> gst-inspect.

 Beno?t> This patch fixes this issue by setting printf configuration
 Beno?t> options compatible with glibc. These options should also be
 Beno?t> compatible with uClibc.

 Beno?t> This solution has been suggested for LTIB by Rogerio Nunes:
 Beno?t> https://community.freescale.com/thread/302734

Committed, thanks.

-- 
Bye, Peter Korsgaard
