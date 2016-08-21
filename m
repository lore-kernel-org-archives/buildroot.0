From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:22:25 +0200
Subject: [Buildroot] [PATCH] tstools: requires dynamic library support
In-Reply-To: <a130ad0abb0b921de5a8f1998ce2cde407082f09.1471799886.git.baruch@tkos.co.il>
References: <a130ad0abb0b921de5a8f1998ce2cde407082f09.1471799886.git.baruch@tkos.co.il>
Message-ID: <20160821222225.7afeebcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Aug 2016 20:18:06 +0300, Baruch Siach wrote:
> tstools Makefile tries to build shared libtstools.so library unconditionally.
> 
> Fixes:
> http://autobuild.buildroot.net/results/208/20830bccab8508aab215c5fc8010e180cc68af51/
> http://autobuild.buildroot.net/results/988/9882f93e11dbaba8c6973bedc9d00dbb238a4c06/
> http://autobuild.buildroot.net/results/11c/11c802bcfab70a0a2593079657529c763fd82aa1/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/tstools/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
