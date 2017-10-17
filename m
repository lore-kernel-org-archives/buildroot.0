From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 08:51:47 +0200
Subject: [Buildroot] [PATCH] ipset: fix musl build
In-Reply-To: <632f9fbe5f6593483186e42020cd2b2db9420c9a.1508176968.git.baruch@tkos.co.il>
References: <632f9fbe5f6593483186e42020cd2b2db9420c9a.1508176968.git.baruch@tkos.co.il>
Message-ID: <20171017085147.2ffd3565@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Oct 2017 21:02:48 +0300, Baruch Siach wrote:
> Add upstream patch removing use of non-standard u_int8_t type.
> 
> Fixes:
> http://autobuild.buildroot.net/results/126/126c97db87cd3bdc6d222982a53d871387cc9b50/
> http://autobuild.buildroot.net/results/22d/22dcb72e75d1844828ba344f5ed126de06d2ab82/
> http://autobuild.buildroot.net/results/b56/b56a6e3b5036c10f2f2b74e36c130d751b2c1312/
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...e-last-reference-to-u_int8_t-with-uint8_t.patch | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/ipset/0001-Replace-the-last-reference-to-u_int8_t-with-uint8_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
