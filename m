From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Sep 2013 10:40:25 +0200
Subject: [Buildroot] [PATCHv2] libevent: Bump to 2.0.21
In-Reply-To: <1380033764-906-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Tue, 24 Sep 2013 16:42:44 +0200")
References: <1380033764-906-1-git-send-email-mjonker@synopsys.com>
Message-ID: <87had98fba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> This fixes the build on ARC as well, as 2.0.17 includes a fix
 Mischa> that checks for existence of 'sysctl'.

 Mischa> v2: Change 2.0.17 to 2.0.21, as that is the latest stable version.

This comment should go under the --- line so it doesn't become part of
the commit message.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
