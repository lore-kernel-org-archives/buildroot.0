From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2014 23:14:59 +0100
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.1.4
In-Reply-To: <1414444421-821-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 27 Oct 2014 18:13:41 -0300")
References: <1414444421-821-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y4rs0w4c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-8080 - Denial of service XML expansion

 > And change default ext/openssl settings WRT CVE-2014-3566.

I know it wasn't caused by this bump, but we have a number of autobuild
issues related to RUBY_EXEC_PREFIX. Could you perhaps take a look
(ignore the bfin ones)?

http://autobuild.buildroot.net/?reason=ruby-2.1.4
http://autobuild.buildroot.net/?reason=ruby-2.1.3

Thanks!

-- 
Bye, Peter Korsgaard
