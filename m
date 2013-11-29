From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 10:10:08 +0100
Subject: [Buildroot] [PATCH v2] qt5base: use ccache if enabled
In-Reply-To: <1385714869-10115-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Fri, 29 Nov 2013 10:47:49 +0200")
References: <1385714869-10115-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <87ob53wp3j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 > For now, it doesn't use ccache when compiling host tools (e.g. qmake).
 > It seems the fix is not trivial.

 > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - pass ccache path to CROSS_COMPILE instead of setting another device
 >     variable (suggested by Peter Korsgaard)

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
