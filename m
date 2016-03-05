From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:14:46 +0100
Subject: [Buildroot] [PATCH] gdb: add upstream patches to fix musl build
In-Reply-To: <1456619434-13793-1-git-send-email-arnout@mind.be>
References: <1456619434-13793-1-git-send-email-arnout@mind.be>
Message-ID: <20160305151446.3cbcc52b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sun, 28 Feb 2016 01:30:34 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Backported three patches from upstream to all four versions of gdb
> that we support.
> 
> The "skipping exited and joined thread" message only exists in 7.10.1
> so that hunk is removed in the earlier versions. The ChangeLog
> modifications are also removed.
> 
> Fixes
> http://autobuild.buildroot.net/results/e81/e8156d0b89e7157b8f10e428fc0958b0eb29e50a/
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I could probably have left out 7.7.1 since it's deprecated, but I
> didn't notice that until after I had created the patches :-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
