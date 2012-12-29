From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Dec 2012 14:31:27 +0100
Subject: [Buildroot] [PATCHv2] wavpack: fix broken link on newer binutils
In-Reply-To: <1356786371-12126-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 29 Dec 2012 10:06:11 -0300")
References: <1356786371-12126-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87sj6pvvbk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Newer versions of binutils (2.22+) default to
 Gustavo> --no-copy-dt-needed hence all the used libraries must be
 Gustavo> explicitly named.  This is accounted for in the source
 Gustavo> configure script but not in the compiled form so we just need
 Gustavo> to autoreconf it.

Committed with a comment explaining why autoreconf is needed, thanks.

-- 
Bye, Peter Korsgaard
