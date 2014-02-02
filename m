From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 10:31:58 +0100
Subject: [Buildroot] [PATCH 2/3] infozip: fix cross-compilation issues
In-Reply-To: <1391120128-8375-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Thu, 30 Jan 2014 23:15:28 +0100")
References: <1391120128-8375-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87txchrhbl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > - Use CFLAGS from command line
 > - Remove "Check C compiler type (optimization options)"
 >   This test force optimization to -O3
 >   while it is already set in CFLAGS

 > - Don't use host CPP

 > - Remove "Check for Large File Support"
 >   LFS support is already set in CFLAGS

 > Note: configure script still use host nm

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

Please don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
