From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 23:07:06 +0200
Subject: [Buildroot] [PATCH] gnutls: make crywrap a tools option
In-Reply-To: <1370444297-17883-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 5 Jun 2013 11:58:17 -0300")
References: <1370444297-17883-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqq8b72d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> crywrap now needs wchar support so just build it when tools are enabled.
 Gustavo> It's also a tool so it belongs there anyway.

 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/418/418ce71eecc1db725e3b3f092131a01cb1666a60/

Committed, thanks.

-- 
Bye, Peter Korsgaard
