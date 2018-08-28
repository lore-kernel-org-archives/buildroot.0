From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 17:12:55 +0200
Subject: [Buildroot] [PATCH] json-c: needs host-autoconf
In-Reply-To: <49134bd0971955402d38a456443d4fb8dba45957.1535468087.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 28 Aug 2018 17:54:47 +0300")
References: <49134bd0971955402d38a456443d4fb8dba45957.1535468087.git.baruch@tkos.co.il>
Message-ID: <871sai5xu0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The json-c configure script uses the autoheader utility. Use the
 > host-autoconf provided autoheader, as this tool is not always installed
 > on the host.

 > Fixes:
 > http://autobuild.buildroot.net/results/030/030fddceda4f5bc6379f7bfcc405e92d2e24184a/
 > http://autobuild.buildroot.net/results/e48/e482f174b8124ace0690a26bb7daf073fe5fcd75/
 > http://autobuild.buildroot.net/results/482/4829425c38c58d9844aa07108532a93d47191d23/

 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
