From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 11:42:09 +0100
Subject: [Buildroot] [PATCH 14/25] lua-bit32: new package
In-Reply-To: <04a224aa-c599-d927-79ad-869dcd7d9f7c@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-15-arnout@mind.be>
 <20170302225441.5adee9f6@free-electrons.com>
 <55bf7d15-ebeb-6bbd-1eaf-c8657c5821fb@mind.be>
 <20170317171427.03270127@free-electrons.com>
 <04a224aa-c599-d927-79ad-869dcd7d9f7c@mind.be>
Message-ID: <20170318114209.123e1ea8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Mar 2017 23:17:25 +0100, Arnout Vandecappelle wrote:

>  I wouldn't say "regularly". I do look occasionally. I would pay a lot more
> attention if I got an occasional personal mail.

OK. But it probably wouldn't be "occasional". From a quick look, we
have currently ~500 packages not associated to a developer, so about
1/4 of all packages we have.

But currently, we indeed don't notice when there is a build failure on
a package that is orphaned. Having at least you notified on orphaned
packages build failures would raise the attention on this or that
package being orphaned, and then we can see what needs to be done: find
if someone has been active on that package recently and is willing to
adopt it, remove the package if it's too broken and nobody cares, etc.

What do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
