From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Dec 2013 22:23:59 +0100
Subject: [Buildroot] [PATCH] python-pycrypto: do not include host headers
In-Reply-To: <1387558781-3471-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 20 Dec 2013 17:59:41 +0100")
References: <1387558781-3471-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gazjjww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to python-pycrypto that removes /usr/include
 > for the headers path, which is wrong when cross-compiling.

 > Fixes:

 >   http://autobuild.buildroot.org/results/5bf/5bf5e31c485a4ee8c0b0a5721205f0fed9b5ae5d/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
