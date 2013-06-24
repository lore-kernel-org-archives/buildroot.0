From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jun 2013 13:33:05 +0200
Subject: [Buildroot] [PATCH] tinyhttpd: do not link against pthread
In-Reply-To: <1371837584-6270-1-git-send-email-gilles.talis@gmail.com> (Gilles
 Talis's message of "Fri, 21 Jun 2013 10:59:44 -0700")
References: <1371837584-6270-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <871u7rkaku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Original patch for tinyhttpd disables pthread support from the code
 Gilles> but does not disable it from makefile.
 Gilles> This patch disables pthread support altogether

Committed, thanks.

-- 
Bye, Peter Korsgaard
