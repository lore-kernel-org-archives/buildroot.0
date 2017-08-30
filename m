From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:07:52 +0200
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.22
In-Reply-To: <10033e7b173d98374eac45d28e1fb97f68e82118.1504094464.git.baruch@tkos.co.il>
References: <10033e7b173d98374eac45d28e1fb97f68e82118.1504094464.git.baruch@tkos.co.il>
Message-ID: <20170830220752.118abfee@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Aug 2017 15:01:04 +0300, Baruch Siach wrote:
> Mitigate a flush+reload side-channel attack on RSA secret keys
> dubbed "Sliding right into disaster".  For details see
> <https://eprint.iacr.org/2017/627>.  [CVE-2017-7526]
> 
> Switch to https site for better firewall compatibility and security.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/gnupg/gnupg.hash | 7 +++----
>  package/gnupg/gnupg.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
