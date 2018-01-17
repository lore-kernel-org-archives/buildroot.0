From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 23:42:35 +0100
Subject: [Buildroot] [PATCH 5/5] python-crossbar: bump to version
 17.6.1.post3
In-Reply-To: <20180111092520.28438-5-yegorslists@googlemail.com>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
 <20180111092520.28438-5-yegorslists@googlemail.com>
Message-ID: <20180117234235.032486fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Jan 2018 10:25:20 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Update dependencies and add licence checksum.
> 
> As BR now has the latest setuptools version, remove now obsolete
> comment.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied, thanks!

Crossbar has a lot of dependencies, so perhaps it would be useful to
add a runtime test for it in support/testing/ ? I.e a test that builds
a configuration with Crossbar enabled, boots it and verifies that
Crossbar works in a minimal way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
