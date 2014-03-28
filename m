From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2014 09:56:19 +0100
Subject: [Buildroot] [PATCH 2/2] slang: add ncurses optional dependency
In-Reply-To: <1395961593-9826-2-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Fri, 28 Mar 2014 00:06:33 +0100")
References: <1395961593-9826-1-git-send-email-romain.naour@openwide.fr>
 <1395961593-9826-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <87vbuyg0r0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Ncurses check need to be disabled if ncurses package is not
 > selected.
 > If we don't do that, host's ncurses5-config may be used by
 > configure script.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

 > Note: others optional dependencies may be missing
 > (pcre oniguruma png z iconv)

Care to cook up a patch for those?

-- 
Bye, Peter Korsgaard
