From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:37:02 +0200
Subject: [Buildroot] [PATCH 04/13] pkg-generic: make PKG_DL_DIR equal to
 DL_DIR
In-Reply-To: <20170704162211.13238-5-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-5-maxime.hadjinlian@gmail.com>
Message-ID: <20170722233702.3dbc4ce7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:22:02 +0200, Maxime Hadjinlian wrote:
> This variable is currently not used by anyone.
> The value is changed to match the path to DL_DIR.
> 
> The next patch will introduce the use of PKG_DL_DIR for packages that
> use specific EXTRACT_CMDS.
> 
> And then we will be able to change the value of PKG_DL_DIR to create a
> new directory structure in DL_DIR with a subdirectory for each package.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
