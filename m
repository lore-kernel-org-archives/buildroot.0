From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Apr 2013 23:17:29 +0200
Subject: [Buildroot] [PATCH] dnsmasq: build with MAKE1
In-Reply-To: <1366236635-6353-1-git-send-email-gilles.talis@gmail.com> (Gilles
 Talis's message of "Wed, 17 Apr 2013 15:10:35 -0700")
References: <1366236635-6353-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <878v4bh9cm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> dnsmasq build breaks with parallel builds.  By the time final
 Gilles> target needs to be linked, some object files are missing.

 Gilles> Fix it by using MAKE1 instead.

 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/7a68e2f64105013c1040c01c0e55fb5d910ef8d8

Committed, thanks.

-- 
Bye, Peter Korsgaard
