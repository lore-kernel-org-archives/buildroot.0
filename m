From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:14:24 +0200
Subject: [Buildroot] [PATCH] libcurl: apply upstream security patch
In-Reply-To: <1796640bb50f0f0d5f8f24ccd56081cc28a7598f.1491933372.git.baruch@tkos.co.il>
References: <1796640bb50f0f0d5f8f24ccd56081cc28a7598f.1491933372.git.baruch@tkos.co.il>
Message-ID: <20170412211424.0551c425@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 20:56:12 +0300, Baruch Siach wrote:
> CVE-2017-7407: --write-out out of buffer read
> 
> https://curl.haxx.se/docs/adv_20170403.html
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libcurl/0001-CVE-2017-7407.patch | 61 ++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/libcurl/0001-CVE-2017-7407.patch

Applied to master, thanks.

Peter: we want this one in the LTS branch I believe.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
