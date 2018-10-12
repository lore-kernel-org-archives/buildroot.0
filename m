From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Oct 2018 11:25:21 +0200
Subject: [Buildroot] [PATCH] ntp: fix build for no-MMU
In-Reply-To: <86942174a35cf04e0a51577788542fe32ebfe291.1539335878.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 12 Oct 2018 12:17:58 +0300")
References: <86942174a35cf04e0a51577788542fe32ebfe291.1539335878.git.baruch@tkos.co.il>
Message-ID: <87o9bzzfcu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Code rearrange in the latest ntp version exposed code that used to be
 > hidden behind HAVE_WORKING_FORK. Put this code back where it belongs.

 > Fixes:
 > http://autobuild.buildroot.net/results/9f4/9f4710b451df1a60f95ab6503cfb7788ad998a65/
 > http://autobuild.buildroot.net/results/d0b/d0b20a6c0f37a8b06841afc2764c8aab6ffd27d2/
 > http://autobuild.buildroot.net/results/85c/85c89f5e9d36915567b8d14b9c99e3720c866577/

 > Cc: Artem Panfilov <apanfilov@spectracom.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
