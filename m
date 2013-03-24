From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 14:29:14 +0100
Subject: [Buildroot] [PATCH] toolchain/gcc: disable makeinfo
In-Reply-To: <1363984348-25838-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Mar 2013 17:32:28 -0300")
References: <1363984348-25838-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hak1j591.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Newer versions of texinfo (>=5) break the gcc makeinfo
 Gustavo> routine, so just disable it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
