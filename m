From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 13:57:03 +0100
Subject: [Buildroot] [PATCH] busybox: bump version to 1.26.2
In-Reply-To: <20170120144627.10087-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 20 Jan 2017 15:46:27 +0100")
References: <20170120144627.10087-1-peter@korsgaard.com>
Message-ID: <877f5or2ow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > And drop patches now upstream.  Also enable internal glob() handling in ash,
 > as busybox now errors out if this isn't enabled when building for uClibc
 > because of bugs in the the glob(3) implementation in uClibc and musl since:

 > commit 3a4cdf45f928de0af09088bbbb96f60d9ac44e87
 > Author: Denys Vlasenko <vda.linux@googlemail.com>
 > Date:   Wed Dec 21 04:13:23 2016 +0100

 >     ash: error out if ASH_INTERNAL_GLOB is not selected on uClibc

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
