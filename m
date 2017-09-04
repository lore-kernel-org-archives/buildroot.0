From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 09:04:50 +0200
Subject: [Buildroot] [PATCH] python-libconfig: fix Python3 build
In-Reply-To: <20170727084515.19623-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 27 Jul 2017 10:45:15
 +0200")
References: <20170727084515.19623-1-yegorslists@googlemail.com>
Message-ID: <87shg3ndv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > boost_python library is named boost_python3, if boost is built
 > under Python3 environment. The patch fixes setup.py accordingly.

 > Fixes:
 > http://autobuild.buildroot.net/results/975/97533965180436c2f7a99de07fdc360ef57f84b0
 > http://autobuild.buildroot.net/results/b49/b49de32704f0f7ce5a610cf4363c6dcc2d8bafa1
 > http://autobuild.buildroot.net/results/e26/e26b4b9b486c582fb55826817a3428569968320f

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
