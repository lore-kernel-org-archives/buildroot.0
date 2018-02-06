From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 17:08:06 +0100
Subject: [Buildroot] [PATCH 1/1] udftools: new package
In-Reply-To: <20180122213138.11855-1-skenton@ou.edu>
References: <20180122213138.11855-1-skenton@ou.edu>
Message-ID: <20180206170806.1ffc1c28@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Jan 2018 15:31:38 -0600, Steve Kenton wrote:
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> ---
> Try 2: fix stupid copy paste error in Config.in
> Try 3: remove duplicate/misplaced addition to master Config.in
> I wish I could see these issues  when I first look the patch over - sigh
> Try 4: Fixes for feedback from Thomas
> I computed the hash below for the license file but I did not see any others under the package directory
> so I think I must be misunderstanding where it should go from my reading of the on-line manual
> # Locally computed
> sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> I ran ./utils/check-package package/udftools/* and fixed up all the white space errors
> But I'm not sure what to do with ./utils/test-pkg, do I need to build all 47 tools chains?
> I tried ./utils/test-pkg -p udftools -c udftools.snippet (contents below) but just got errors
> BR2_PACKAGE_UDFTOOLS=y

I've added a hash for the license file, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
