From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 23:18:43 +0200
Subject: [Buildroot] [PATCH v2] bfin: change default to bf532,
 internal toolchain !bf6xx
In-Reply-To: <20160706223014.GA12952@waldemar-brodkorb.de>
References: <20160706223014.GA12952@waldemar-brodkorb.de>
Message-ID: <20160827231843.3a3abe79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 00:30:15 +0200, Waldemar Brodkorb wrote:
> The default Blackfin processor in Buildroot isn't supported by
> gcc 6.1.0, so use bf532 as default. Disable any bf6xx processors
> for internal toolchain users.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - revert logic, disable internal toolchain for bf6xx suggested
>     by Thomas Petazzoni
> ---
>  arch/Config.in.bfin | 2 +-
>  toolchain/Config.in | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
