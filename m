From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 10:16:45 +0200
Subject: [Buildroot] [PATCH] apitrace: needs gcc 4.6 or later
In-Reply-To: <084ad68ad5b3f1b650d49638adffc0cb441986f4.1443591219.git.baruch@tkos.co.il>
References: <084ad68ad5b3f1b650d49638adffc0cb441986f4.1443591219.git.baruch@tkos.co.il>
Message-ID: <20150930101645.41382d6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 30 Sep 2015 08:33:39 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/4a1/4a183b05b44833ee2f253749c39257b31db963ac/
> http://autobuild.buildroot.net/results/a9c/a9c4ed838fae31cb680ff5e19bf03dd7e2f85094/
> http://autobuild.buildroot.net/results/026/026eecffd262b0be6675001ee2f5a635207e55c7/
> 
> and more.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/apitrace/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
