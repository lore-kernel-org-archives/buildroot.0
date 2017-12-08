From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 17:45:33 +0100
Subject: [Buildroot] [PATCH] fastd: fix build with newer libsodium
In-Reply-To: <c807b9a816f86998b946f7508e1adbcc42aaa3b1.1512668886.git.baruch@tkos.co.il>
References: <c807b9a816f86998b946f7508e1adbcc42aaa3b1.1512668886.git.baruch@tkos.co.il>
Message-ID: <20171208174533.3bfc8f82@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Dec 2017 19:48:06 +0200, Baruch Siach wrote:
> Add upstream patch removing aes128-ctr support that libsodium no longer
> provides.
> 
> Fixes:
> http://autobuild.buildroot.net/results/90c/90c526491a9eb6b5ceb38a0218fd480c03208217/
> http://autobuild.buildroot.net/results/f81/f815dbfee7099f3b8fea7036e1fd10385f8c6a80/
> http://autobuild.buildroot.net/results/329/3299d413ee98963e62c0df4087604c9872fcad68/
> 
> Cc: Alexander Dahl <post@lespocky.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...her-remove-aes128-ctr-NaCl-implementation.patch | 137 +++++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 package/fastd/0001-cipher-remove-aes128-ctr-NaCl-implementation.patch

Applied to master, after fixing the patch numbering, as noticed by
Alexander Dahl. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
