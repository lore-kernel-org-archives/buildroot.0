From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 20:54:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtomcrypt: add security patch
 for CVE-2019-17362
In-Reply-To: <20191223150338.20370-1-patrickdepinguin@gmail.com>
References: <20191223150338.20370-1-patrickdepinguin@gmail.com>
Message-ID: <20191223205451.3adf6c29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Dec 2019 16:03:37 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> CVE-2019-17362:
> "The der_decode_utf8_string function (in der_decode_utf8_string.c) does not
> properly detect certain invalid UTF-8 sequences.  This allows
> context-dependent attackers to cause a denial of service (out-of-bounds read
> and crash) or read information from other memory locations via carefully
> crafted DER-encoded data."
> 
> Details:
> https://github.com/libtom/libtomcrypt/issues/507
> https://nvd.nist.gov/vuln/detail/CVE-2019-17362
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  .../libtomcrypt/0001-fix-CVE-2019-17362.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libtomcrypt/0001-fix-CVE-2019-17362.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
