From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 00:21:33 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix double-conversion for or1k
In-Reply-To: <20180818224236.2422-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 19 Aug 2018 00:42:36 +0200")
References: <20180818224236.2422-1-ps.report@gmx.net>
Message-ID: <87y3d2knf6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]:
 >   ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
 >   #error Target architecture was not detected as supported by Double-Conversion.

 > [1] http://autobuild.buildroot.net/results/a3535cdf5e91df011a59a4b9f60d69195f5efdcb

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
