From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Dec 2015 21:50:06 +0100
Subject: [Buildroot] [PATCH 2/2] Use libgudev as regular dependency
In-Reply-To: <1449055626-4640-2-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 2 Dec 2015 12:27:06
 +0100")
References: <1449055626-4640-1-git-send-email-yegorslists@googlemail.com>
 <1449055626-4640-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <87egewmzr5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Since eudev 3.1.3 libgudev is not shipped with this package,
 > so libgudev can be used as regular dependency regardless of
 > udev implementation selected.

 > Fixes following build error:
 >   http://autobuild.buildroot.net/results/320/320c052bda0f1b5afb1e5c83a7fb4dca6227c5a1//
 >   http://autobuild.buildroot.net/results/3b0/3b096f882030325b9290ad8860bd9cd373a11dc2//

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
