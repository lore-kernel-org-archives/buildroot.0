From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Jul 2013 22:12:24 +0200
Subject: [Buildroot] [PATCH] libevent: disable building test programs
In-Reply-To: <1371859143-31329-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Fri, 21 Jun 2013 16:59:03 -0700")
References: <1371859143-31329-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <8738rwu3fb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Libevent test programs use fork(), function
 Gilles> that is not available on MMU-less architecture.

 Gilles> This patch prevents compiling libevent test programs
 Gilles> so that library can successfully build on architectures
 Gilles> like blackfin

 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/2e0/2e0422f1042d0cb00f5bab0dc190930581ed4ef2/

Committed, thanks.

-- 
Bye, Peter Korsgaard
