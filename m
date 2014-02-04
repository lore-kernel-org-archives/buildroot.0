From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 20:00:27 +0100
Subject: [Buildroot] [PATCH 1/1] gnutls: fix libz autodetection failure
In-Reply-To: <1391525863-22787-1-git-send-email-antoine@bokbox.com> (Antoine
 Pierlot-Garcin's message of "Tue, 4 Feb 2014 15:57:43 +0100")
References: <1391525863-22787-1-git-send-email-antoine@bokbox.com>
Message-ID: <87a9e64sac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Antoine" == Antoine Pierlot-Garcin <antoine@bokbox.com> writes:

 > The configure script finds libz in the distribution libraries, which causes
 > zlib support to be dropped from the cross-compiled GnuTLS.

 > Signed-off-by: Antoine Pierlot-Garcin <antoine@bokbox.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
