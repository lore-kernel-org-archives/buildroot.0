From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jul 2013 00:09:51 +0200
Subject: [Buildroot] [PATCH] classpath: fix build errors with gmp support
In-Reply-To: <1372953571-15249-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 4 Jul 2013 12:59:31 -0300")
References: <1372953571-15249-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761wmggy8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> gmp support has a hardcoded /usr/include include PATH which causes
 Gustavo> breakage when there is a distribution gmp with development headers
 Gustavo> installed. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/849/8497648c0b21390782eecc5b4aa91281bcf58ad6/

Committed, thanks.

-- 
Bye, Peter Korsgaard
