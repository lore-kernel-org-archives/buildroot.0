From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:10:01 +0200
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version 1.7.8
In-Reply-To: <21e15290feb7138acb60802800e8fbb4c12d4a62.1498835094.git.baruch@tkos.co.il>
References: <21e15290feb7138acb60802800e8fbb4c12d4a62.1498835094.git.baruch@tkos.co.il>
Message-ID: <20170701101001.479e7582@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 18:04:54 +0300, Baruch Siach wrote:
> From the NEWS file:
> 
> - Mitigate a flush+reload side-channel attack on RSA secret keys
>   dubbed "Sliding right into disaster".  For details see
>   <https://eprint.iacr.org/2017/627>.  [CVE-2017-7526]
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libgcrypt/libgcrypt.hash | 9 +++++----
>  package/libgcrypt/libgcrypt.mk   | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
