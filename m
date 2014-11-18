From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 08:40:48 +0100
Subject: [Buildroot] [PATCH] package/rpm: add missing kconfig dependency
	to zlib
In-Reply-To: <1416248141-10766-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 17 Nov 2014 19:15:41 +0100")
References: <1416248141-10766-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ioidarcv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since we build-depend on zlib, forcibly select it from kconfig.
 > This went unnoticed so far, because we did select openssl which
 > in turn selects zlib. But rpm needs zlib for itself, too.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
