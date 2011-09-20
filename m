From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Sep 2011 22:20:43 +0200
Subject: [Buildroot] [PATCH 5/5] xenomai: install in /usr
In-Reply-To: <eee4c1d4898af5dd12bc695b5a151fd0b7dbeae5.1316463052.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:10:56 +0200")
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <eee4c1d4898af5dd12bc695b5a151fd0b7dbeae5.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mxdz2cf8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> By default, Xenomai installs everything with --prefix=/usr/xenomai,
 Thomas> and passing --prefix=/usr doesn't work because installing Xenomai
 Thomas> headers in /usr/include creates conflicts with other headers. However,
 Thomas> passing --prefix=/usr and --includedir=/usr/include/xenomai just works
 Thomas> fine. This allows to use the default configure command of the
 Thomas> AUTOTARGETS infrastructure, and allows to install the Xenomai headers
 Thomas> and libraries into more usual locations. Furthermore, it allows to
 Thomas> remove the documentation/headers removal hooks, as well as the
 Thomas> ld.so.conf hook since now everything is installed in standard
 Thomas> locations.

Committed, thanks.

-- 
Bye, Peter Korsgaard
