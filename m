From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Jun 2013 19:41:07 +0200
Subject: [Buildroot] [PATCH] qt: broken on avr32
In-Reply-To: <1372342452-25725-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 27 Jun 2013 11:14:12 -0300")
References: <1372342452-25725-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761wz30zw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Qt is broken for the avr32 architecture since it lacks TLS support.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/56d/56d1d8f12a847f1ba49547a51d7a3605755a0bb8/

Committed, thanks.

-- 
Bye, Peter Korsgaard
