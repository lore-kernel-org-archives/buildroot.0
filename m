From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:54:44 +0100
Subject: [Buildroot] [PATCH] lksctp-tools: fix musl build
In-Reply-To: <1457602091-14399-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 10 Mar 2016 10:28:11
 +0100")
References: <1457602091-14399-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <877fh38l0b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Add a patch replacing __BEGIN_DECLS/__END_DECLS with
 > "extern "C" {" definition.

 > Fixes:

 > http://autobuild.buildroot.net/results/d7d/d7d1c6a13ad788ef74ac0487bf2bdbdcd7d52d40/
 > http://autobuild.buildroot.net/results/06a/06a76d80701b126789c6c8e867db067e3b927caa/

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
