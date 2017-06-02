From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Jun 2017 08:41:44 +0200
Subject: [Buildroot] [PATCH] swupdate: fix build without json-c
In-Reply-To: <3490aaf3fa9ecc82542a416fa6908dc1bc666b61.1496379323.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 2 Jun 2017 07:55:23 +0300")
References: <3490aaf3fa9ecc82542a416fa6908dc1bc666b61.1496379323.git.baruch@tkos.co.il>
Message-ID: <87y3tagac7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > swupdate enables SURICATTA_HAWKBIT by default, which unconditionally selects
 > JSON. This breaks the build when the optional json-c dependency is not built.
 > Add a patch fixing SURICATTA_HAWKBIT dependencies.

 > Fixes:
 > http://autobuild.buildroot.net/results/e61/e6179f515589a42a9aee16b54b897ef9111e7f4b/
 > http://autobuild.buildroot.net/results/dba/dba54b00c81f62d957a8c189dde39ba0db8864e6/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
