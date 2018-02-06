From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 17:22:01 +0100
Subject: [Buildroot] [PATCH v2 1/1] support/dependencies: add check for
 c++ multilib
In-Reply-To: <20180205215708.16363-1-gael.portay@savoirfairelinux.com>
References: <20180205215708.16363-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180206172201.53059429@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Feb 2018 16:57:08 -0500, Ga?l PORTAY wrote:
> Some packages build C++ 32bits host-tools and need the g++-multilib to
> be installed on the build machine. As example, qt5webengine builds a C++
> host-tool when target is 32bits.
> 
> Add the check for g++-multilib to the dependencies script; and update
> the Dockerfile to install g++-multilib package.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---

Applied to master, thanks. Both Arnout and I thought that it was not
really worth having a separate option for this, as it would hardly be
tested. So the approach you have submitted looked good enough to us.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
