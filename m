From: Richard Braun <rbraun@sceen.net>
Date: Sat, 21 Jul 2012 17:17:30 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <20120721145411.6e291ad2@skate>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate>
 <20120720233136.GA25851@mail.sceen.net>
 <20120721145411.6e291ad2@skate>
Message-ID: <20120721151730.GA2543@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 21, 2012 at 02:54:11PM +0200, Thomas Petazzoni wrote:
> However, I don't agree with the change you did on -reconfigure that
> would only to the configure step. If -rebuild does build+install, then
> -reconfigure should do configure+build+install.

Right, after a bit more thinking, I agree.

-- 
Richard Braun
