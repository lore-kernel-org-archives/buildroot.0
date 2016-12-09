From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Dec 2016 18:10:15 +0100
Subject: [Buildroot] [PATCH] coreutils: bump to version 8.26
In-Reply-To: <1481290989-12966-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 9 Dec 2016 10:43:09 -0300")
References: <1481290989-12966-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871sxhhvuw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Pass on INSTALL_PROGRAM to configure since starting with version 8.26
 > when building natively it tries to use the self-built install to
 > install, and when cross-compiling it expects INSTALL_PROGRAM to point to
 > a real install, or otherwise fails when recursively trying to expand it.

Funky. Have you reported this upstream?

Committed, thanks.

-- 
Bye, Peter Korsgaard
