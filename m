From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 22:33:35 +0200
Subject: [Buildroot] [PATCH] binutils: arc: fix custom patch
In-Reply-To: <1493040114-32538-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Mon, 24 Apr 2017 16:21:54 +0300")
References: <1493040114-32538-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87bmrlsfz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > This commit fixes another brown-paper-bag issue that I've introduced by
 > my following patch:
 > toolchain: Bump ARC tools to arc-2017.03-rc1
 > (5f8ef7e25c5cc5c2e4ae4c8b6e8caa029ddf9a94)

 > arc-2017.03-rc1 differs a bit from 2.28. And so corresponding
 > of-the-tree patch should be updated appropriately.

 > Fixes target binutils build for arc:
 > http://autobuild.buildroot.net/results/f67/f67c905979870936d8050a505b61186be6dad85d//

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Committed after tweaking the commit message, thanks.

-- 
Bye, Peter Korsgaard
