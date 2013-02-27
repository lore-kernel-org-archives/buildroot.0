From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Feb 2013 08:46:32 +0100
Subject: [Buildroot] [PATCH] flashbench: force gnu99 dialect on sh2a
In-Reply-To: <1361928158-27934-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Tue, 26 Feb 2013 17:22:38 -0800")
References: <1361928158-27934-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87vc9e5hd3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/33880036054c39cb04dad71bc8c0a9eece16fac6

 Gilles> CodeSourcery toolchains for sh2a only provide LLONG_MAX when
 Gilles> used with the gnu99 dialect.

Committed, thanks.

-- 
Bye, Peter Korsgaard
