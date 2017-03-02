From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:29:03 +0100
Subject: [Buildroot] [PATCH 01/25] lutok: move to Lua libraries menu
In-Reply-To: <20170223170047.24417-2-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-2-arnout@mind.be>
Message-ID: <20170302222903.65370e58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:23 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since this package really is a Lua extension, it fits under the Lua
> libraries menu.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied to master, thanks.

> The original patch had lutok before the Lua libraries menu, which is
> also not appropriate. Thomas moved it to after the menu while
> committing. It's not clear to me why Thomas didn't move it inside the
> menu instead.

Not sure why I did that. I even explicitly wrote in the commit log that
I did this change on purpose. Really, I don't see why. I applied the
patch at 21:41, so not even too late. Dunno.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
