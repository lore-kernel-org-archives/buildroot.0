From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Apr 2013 22:41:33 +0200
Subject: [Buildroot] [PATCH] linknx: forcilbly disable smtp support
In-Reply-To: <1364984878-829-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 3 Apr 2013 07:27:58 -0300")
References: <1364984878-829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hajn73eq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> linknx has support for SMTP via libesmtp, however there's no clean way
 Gustavo> to specify where libesmtp-config lives.
 Gustavo> So when libesmtp is built it finds it via the headers and is
 Gustavo> automatically enabled, but it fails to get the appropiate link line from
 Gustavo> libesmtp-config because it's not found.
 Gustavo> Fix it by forcibly disabling it. If someone is interested in working
 Gustavo> with upstream about this an option like --with-libcurl should be
 Gustavo> implemented in configure.
 Gustavo> Solves:
 Gustavo> http://autobuild.buildroot.net/results/90ebb383d7a2d7bdf09ffac65e2504da7b6d19f5/

Committed, thanks.

-- 
Bye, Peter Korsgaard
