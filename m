From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Jun 2012 22:11:06 +0200
Subject: [Buildroot] [PATCH] php: force cross-compilation
In-Reply-To: <1340317344-22807-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 22 Jun 2012 00:22:24 +0200")
References: <1340317344-22807-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y5ndbxgl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This fixes build problems like
 Thomas> http://autobuild.buildroot.org/results/e3c5815766fdcf3f13b06fa0758ec418618ac4be/build-end.log.

Thanks, committed. It would be good to add cache support to
ac_cv_prog_cc_cross, so we could just pass ac_cv_prog_cc_cross=yes in
PHP_CONF_ENV, but ok.

-- 
Bye, Peter Korsgaard
