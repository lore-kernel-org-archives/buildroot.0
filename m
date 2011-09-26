From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Sep 2011 22:16:39 +0200
Subject: [Buildroot] [PATCH] kexec: fix compilation with gcc 4.6
In-Reply-To: <1317040277-1183-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 26 Sep 2011 14:31:17 +0200")
References: <1317040277-1183-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <8739fjxdnc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> gcc 4.6 has stricter checks for invalid command-line options.
 Sven> Fix compilation by passing linker options with -Wl,

Committed, thanks.

-- 
Bye, Peter Korsgaard
