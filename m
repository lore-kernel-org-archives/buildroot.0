From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Jul 2013 13:33:04 +0200
Subject: [Buildroot] [PATCH] Makefile: unexport RUBYOPT
In-Reply-To: <1373553453-30335-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 11 Jul 2013 11:37:33 -0300")
References: <1373553453-30335-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mwpsdndb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On Gentoo systems with ruby installed RUBYOPT is set and causes build
 Gustavo> breakage for some packages that needs host-ruby (example: webkit).

Committed, thanks.

-- 
Bye, Peter Korsgaard
