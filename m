From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 21:03:14 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: requires C++
In-Reply-To: <6863f849e68b9f2422f15fef9e815ac791b32c73.1493577198.git.baruch@tkos.co.il>
References: <6863f849e68b9f2422f15fef9e815ac791b32c73.1493577198.git.baruch@tkos.co.il>
Message-ID: <20170430210314.7656594d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 21:33:18 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/9b1/9b1cba480102746389e80b58c0e327b68a235a29/
> http://autobuild.buildroot.net/results/f65/f65de186324e6c3cd689540a22fa46ae89afc8c8/
> http://autobuild.buildroot.net/results/e02/e02e832a49972ba464f7749cb89d2b20b8df4484/
> 
> Cc: Laurent Cans <laurent.cans@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/aircrack-ng/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
