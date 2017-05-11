From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:21:05 +0200
Subject: [Buildroot] [PATCH] strongswan: fix crypt() redefinition
In-Reply-To: <8087559eb746cd7594ec07431a2c6794678f0905.1494501731.git.baruch@tkos.co.il>
References: <8087559eb746cd7594ec07431a2c6794678f0905.1494501731.git.baruch@tkos.co.il>
Message-ID: <20170511212105.0b3b0b67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 14:22:11 +0300, Baruch Siach wrote:
> Add patch from upstream pending pull request (#72) to fix crypt() definition
> conflict.
> 
> Fixes:
> http://autobuild.buildroot.net/results/612/6120add5ad6e7f5d575fc2a2442cd7fe5302eb46/
> http://autobuild.buildroot.net/results/ba1/ba1298e71ef28857654ae8d4593d09e4fe8cdda0/
> http://autobuild.buildroot.net/results/6b9/6b928e2a6a35bfb21c792fca083bc4cbdaef9304/
> 
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...0001-af_alg-fix-crypt-definition-conflict.patch | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/strongswan/0001-af_alg-fix-crypt-definition-conflict.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
