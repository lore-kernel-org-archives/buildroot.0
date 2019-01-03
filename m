From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Jan 2019 22:49:54 +0100
Subject: [Buildroot] [PATCH] package/efivar: bump version to 35
In-Reply-To: <20190103095842.1670-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 3 Jan 2019 10:58:41 +0100")
References: <20190103095842.1670-1-peter@korsgaard.com>
Message-ID: <87d0pdo1h9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/545/545013d3977b3eddd27ca0fc21cc1248f3bb0dbb/
 > http://autobuild.buildroot.net/results/695/6952b99eb0b0e85b2f5408accdca2b4dd17d14c0/

 > Includes a workaround for -Werror=stringop-overflow= erroring out on strncpy
 > on some toolchains:

 > https://github.com/rhboot/efivar/commit/7461d47cddf1cb27b1aeb646e1cdc9f7ecc6219a

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
