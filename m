From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Dec 2012 08:37:53 +0100
Subject: [Buildroot] [PATCH] gettext: disable tools tests when no threads
In-Reply-To: <1356179462-2125-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 22 Dec 2012 09:31:02 -0300")
References: <1356179462-2125-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738yxusku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Disable the gettext-tools tests build since they break when a full
 Gustavo> toolchain without threads is being used.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/a187c76c359787f8e2ec6e12da2d7b1e33ed43c5/

Committed, thanks.

-- 
Bye, Peter Korsgaard
