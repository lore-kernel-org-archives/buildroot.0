From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:31:18 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain-configs.csv: re-organize
 for test-pkg
In-Reply-To: <20180323214815.19831-2-thomas.petazzoni@bootlin.com>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
 <20180323214815.19831-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180401163118.0bd49e54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Mar 2018 22:48:13 +0100, Thomas Petazzoni wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit reorganizes the toolchain-configs.csv so that the first
> toolchains are a subset of "useful" toolchains to be tested by
> contributors to validate a package. This subset is the one that will
> be used by default by test-pkg.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes since v1:
> - Add better comments to explain the two "sections" of the toolchain
>   list, as suggested by Yann E. Morin.
> ---
>  .../autobuild/toolchain-configs.csv                | 32 ++++++++++++++++++----
>  1 file changed, 26 insertions(+), 6 deletions(-)

Series applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
