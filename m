From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Oct 2012 20:53:02 +0200
Subject: [Buildroot] [PATCHv2] openssl: disable apps for NOMMU
In-Reply-To: <1350920528-20247-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 22 Oct 2012 12:42:08 -0300")
References: <1350920528-20247-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mwzenxtd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The openssl binary uses fork() so disable the option and build for !MMU.
 Gustavo> Fixes
 Gustavo> http://autobuild.buildroot.net/results/45a9b84c16caadbf77b6fc43d7a0001c981a4c87/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
