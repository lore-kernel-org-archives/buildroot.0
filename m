From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 15:23:44 +0200
Subject: [Buildroot] [PATCH] php: fix phar build failure for CLI
In-Reply-To: <1404824443-5326-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 8 Jul 2014 10:00:43 -0300")
References: <1404824443-5326-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhs4x9un.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Disable the phar command-line tool since it requires php to pack itself
 > up. Fixes build failure for CLI (or CLI+CGI) variants of php.
 > Hardly useful for embedded scenarios.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
