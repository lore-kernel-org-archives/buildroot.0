From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 May 2014 14:39:24 +0200
Subject: [Buildroot] [PATCH] clapack: don't allow on PowerPC uClibc
In-Reply-To: <1399404464-2378-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 6 May 2014 21:27:44 +0200")
References: <1399404464-2378-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eh05epab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > On PowerPC, clapack uses the _fpu_control symbol, which isn't defined
 > on uClibc, so this commit disallows the selection of clapack on
 > PowerPC uClibc configurations. PowerPC/glibc and ARM/uClibc
 > configurations have been tested to build correctly.

 > Fixes:

 >   http://autobuild.buildroot.org/results/d1d/d1d721fa697956218dfc2c865dfb61911cf2600e/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
