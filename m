From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Apr 2014 14:08:23 +0200
Subject: [Buildroot] [PATCH] iproute2: fix build without threads
In-Reply-To: <ac8ac9d4494067e153caae00d4340d9db7fb91d9.1398680427.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 28 Apr 2014 13:20:27 +0300")
References: <ac8ac9d4494067e153caae00d4340d9db7fb91d9.1398680427.git.baruch@tkos.co.il>
Message-ID: <87lhupwtag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > arpd link command lists -pthread explicitly. Disable arpd when threads are not
 > supported.

 > Fixes:
 > http://autobuild.buildroot.net/results/88e/88eac71e674f773439b953956af3ded71465cf9e/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
