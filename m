From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jan 2013 00:36:45 +0100
Subject: [Buildroot] [PATCH] wavpack: fix the iconv breakage ghost
In-Reply-To: <1357668271-23025-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 8 Jan 2013 15:04:31 -0300")
References: <1357668271-23025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lic39rhu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix missing comma in DEPENDENCIES, causing to pull in libiconv when it
 Gustavo> wasn't necessary and causing other packages to go crazy on (e)glibc
 Gustavo> toolchains which don't need it with libiconv being present. Fixes:
 Gustavo> http://autobuild.buildroot.org/results/e0ce086a33a1db6fee77f43356e4e94ed6941f17

Committed, thanks.

-- 
Bye, Peter Korsgaard
