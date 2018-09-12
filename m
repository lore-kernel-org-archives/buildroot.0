From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:03:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-cryptography: bump
 version to 2.3.1
In-Reply-To: <20180911201408.9453-1-bernd.kuhls@t-online.de>
References: <20180911201408.9453-1-bernd.kuhls@t-online.de>
Message-ID: <20180912210335.4228ca94@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 22:14:08 +0200, Bernd Kuhls wrote:
> Changelog: https://cryptography.io/en/latest/changelog/#v2-3-1
> 
> Please note that CVE-2018-10903, fixed in version 2.3, was introduced
> in version 1.9.0, so it was not present in buildroot:
> https://nvd.nist.gov/vuln/detail/CVE-2018-10903
> 
> Added license hashes and switched runtime dependency from pyasn1 to
> asn1crypto: https://cryptography.io/en/latest/changelog/#v1-8
> 
> Fixed pthread problem by adding -pthread to CFLAGS, suggested by
> https://patchwork.openembedded.org/patch/146240/
> https://bugs.gentoo.org/630578#c6

Could you make sure that this problem is reported upstream ?

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
