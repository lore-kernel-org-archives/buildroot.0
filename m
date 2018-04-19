From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:39:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] prosody: add dependency on shared
 libraries
In-Reply-To: <1524042219-12498-1-git-send-email-danomimanchego123@gmail.com>
References: <1524042219-12498-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20180419233901.4cc2c4ed@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 05:03:39 -0400, Danomi Manchego wrote:
> The prosody package uses several Lua packages that require shared libraries.
> Therefore, prosody must require shared libraries too.
> 
> Fixes: http://autobuild.buildroot.net/results/b126bce0bbd111f021ed5be7c8773fef2a8f8579
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
