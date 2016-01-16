From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 18:19:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: add patch to fix
 undeclared isnan issue
In-Reply-To: <1452806240-4196-1-git-send-email-joerg.krause@embedded.rocks>
References: <1452806240-4196-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160116181913.7fee7421@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 14 Jan 2016 22:17:20 +0100, J?rg Krause wrote:
> Add patch from upstream [1] to fix build error:
>   ./boost/math/special_functions/fpclassify.hpp:137:75: error: '::isnan' has not been declared
> 
> Fixes:
> http://autobuild.buildroot.net/results/6c7/6c72c189cd029fb6c81798f5443fab331358bb90/
> http://autobuild.buildroot.net/results/b70/b709fc201c9df8f76163e2a620da32362abe5288/
> http://autobuild.buildroot.net/results/99b/99bdbc5622dfd0ac369611ec07dd2a8a8fe41ce8/
> http://autobuild.buildroot.net/results/d2b/d2b270787fc20e45c839d5670af55e47723aef2a/
> and many more.
> 
> Backported from: fbd1393858719c7bda7d251f742950c1bc691ea8
> 
> [1] https://github.com/boostorg/math/commit/fbd1393858719c7bda7d251f742950c1bc691ea8
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/0005-fix-undeclared-isnan.patch | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/boost/0005-fix-undeclared-isnan.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
